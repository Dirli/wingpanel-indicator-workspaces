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
    public class Services.WorkspacesManager : GLib.Object {
        public Wnck.Screen screen;

        public int current_ws {
            get {
                unowned Wnck.Workspace ws = screen.get_active_workspace ();
                return ws == null ? -1 : ws.get_number ();
            }
        }

        public int ws_count {
            get {
                return screen.get_workspace_count ();
            }
        }

        public WorkspacesManager () {
            screen = Wnck.Screen.get_default();
            screen.force_update();
        }
    }
}
