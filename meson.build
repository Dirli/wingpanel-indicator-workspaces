project (
    'workspaces',
    'vala', 'c',
    version: '1.0.1'
)

gnome = import ('gnome')

wingpanel_dep = dependency ('wingpanel-2.0')

gresource = gnome.compile_resources (
    'as-resources',
    join_paths ('data/' + meson.project_name () + '.gresource.xml'),
    source_dir: 'data',
    c_name: 'as'
)

shared_module (
    meson.project_name (),
    'src/Indicator.vala',
    'src/Services/WorkspacesManager.vala',
    'src/Widgets/Panel.vala',
    'src/Widgets/Popover.vala',
    gresource,
    dependencies: [
        dependency ('glib-2.0'),
        dependency ('gobject-2.0'),
        dependency ('granite'),
        dependency ('gtk+-3.0'),
        dependency ('libwnck-3.0'),
        wingpanel_dep
    ],
    c_args: [
        '-DWNCK_I_KNOW_THIS_IS_UNSTABLE',
    ],
    install: true,
    install_dir : wingpanel_dep.get_pkgconfig_variable ('indicatorsdir')
)
