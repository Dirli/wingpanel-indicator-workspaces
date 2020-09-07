/*
 * Copyright (c) 2018-2020 Dirli <litandrej85@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

namespace Workspaces {
    public class Indicator : Wingpanel.Indicator {
        private Widgets.Popover? main_widget = null;
        private Widgets.Panel panel_label;
        private Services.WorkspacesManager ws_manager;

        private bool close_popover;

        public Indicator () {
            Object (code_name : "workspaces-indicator");

            Gtk.IconTheme.get_default().add_resource_path("/io/elementary/desktop/wingpanel/workspaces");

            close_popover = true;

            ws_manager = new Services.WorkspacesManager ();

            ws_manager.screen.active_workspace_changed.connect (() => {
                int cur_ws = ws_manager.current_ws;
                panel_label.newval (cur_ws);
                if (close_popover && main_widget != null) {
                    main_widget.ws_box.selected = cur_ws;
                }
            });

            this.visible = true;
        }

        public override Gtk.Widget get_display_widget () {
            if (panel_label == null) {
                panel_label = new Widgets.Panel (ws_manager.current_ws);
                panel_label.scroll_event.connect ((e) => {
                    if (e.direction != Gdk.ScrollDirection.LEFT && e.direction != Gdk.ScrollDirection.RIGHT) {

                        int increment = e.direction == Gdk.ScrollDirection.UP ? 1 :
                                        e.direction == Gdk.ScrollDirection.DOWN ? -1 :
                                        0;

                        int next_ws = ws_manager.current_ws + increment;
                        if (increment != 0 && next_ws > -1 && next_ws <= ws_manager.ws_count) {
                            DateTime now_dt = new DateTime.now_local ();
                            ws_manager.screen.get_workspace (next_ws).activate ((uint32) now_dt.to_unix ());
                        }
                    }

                    return true;
                });
            }

            return panel_label;
        }

        public override Gtk.Widget? get_widget () {
            if (main_widget == null) {
                main_widget = new Widgets.Popover (ws_manager.current_ws, ws_manager.ws_count);

                ws_manager.screen.workspace_created.connect (() => {
                    main_widget.add_ws_btn (ws_manager.ws_count);
                });

                ws_manager.screen.workspace_destroyed.connect ((space) => {
                    main_widget.remove_ws_btn (space.get_number ());
                });
            }

            return main_widget;
        }

        private void on_changed_mode () {
            DateTime now_dt = new DateTime.now_local ();
            ws_manager.screen.get_workspace (main_widget.ws_box.selected).activate ((uint32) now_dt.to_unix ());
            close ();
        }

        public override void opened () {
            close_popover = false;
            main_widget.ws_box.mode_changed.connect (on_changed_mode);
        }

        public override void closed () {
            main_widget.ws_box.mode_changed.disconnect (on_changed_mode);
            close_popover = true;
        }
    }
}

public Wingpanel.Indicator? get_indicator (Module module, Wingpanel.IndicatorManager.ServerType server_type) {
    debug ("Activating Workspaces Indicator");

    if (server_type != Wingpanel.IndicatorManager.ServerType.SESSION) {
        return null;
    }

    var indicator = new Workspaces.Indicator ();
    return indicator;
}
