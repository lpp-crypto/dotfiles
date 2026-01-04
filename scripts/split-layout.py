from i3ipc import Connection, Event

if __name__ == "__main__":
    wm = Connection()
    x = wm.get_tree().find_focused()
    current = x.parent.layout
    print(x.name, current)
    if current in ["splitv", "none"]:
        wm.command("splith")
    else:
        wm.command("splitv")
