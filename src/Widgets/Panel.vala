/*
 * Copyright (c) 2018 Dirli <litandrej85@gmail.com>
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
    public class Widgets.Panel : Gtk.Grid {
        private Gtk.Label ws_label;

        public Panel (int cur_val) {
            ws_label = new Gtk.Label ("%d".printf (cur_val + 1));
            ws_label.margin_bottom = 3;
            Gtk.Image ws_icon = new Gtk.Image.from_icon_name ("tv-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
            attach (ws_icon, 0, 0, 1, 1);
            attach (ws_label, 0, 0, 1, 1);
        }

        public void newval (int newval) {
            ws_label.label = "%d".printf (newval + 1);
        }
    }
}
