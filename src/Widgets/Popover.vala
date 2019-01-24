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
    public class Widgets.Popover : Gtk.Grid {
        public Granite.Widgets.ModeButton ws_box;

        public Popover (int current_ws, int ws_count) {
            ws_box = new Granite.Widgets.ModeButton ();
            ws_box.expand = true;
            ws_box.orientation = Gtk.Orientation.VERTICAL;

            int i = 0;

            while (ws_count > i) {
                ++i;
                ws_box.append_text (@"Workspace $i");
            }
            ws_box.selected = current_ws;
            attach (ws_box, 0, 0, 1, 1);
        }

        public void add_ws_btn (int ws_count) {
            ws_box.append_text ("Workspace %d".printf (ws_count));
        }

        public void remove_ws_btn (int ws_index) {
            ws_box.remove (ws_index);
        }
    }
}
