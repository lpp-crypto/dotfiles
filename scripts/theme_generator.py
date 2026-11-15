import argparse



# !SECTION! Templates
# !====================


# !SUBSECTION! Generating waybar theme for etabli display
# !------------------------

def etabli_waybar(highlight: str, color1: str, color2: str, dimmed: str) -> str:
    result  = '[theme]\n'
    result += 'hrule = "…………"\n'
    result += 'old_highlight = "underline"\n'
    result += f"""
[theme.workspace]
focused           = "{highlight}"
in_focused_level  = "{color1}"
level_last        = "{color2}"
visible_elsewhere = "{highlight}"
unseen_here       = "{color2}"
unseen_anywhere   = "{color2}"
    """
    result += f"""
[theme.level]
focused           = "{highlight}"
visible_elsewhere = "{color1}"
unseen_here       = "{dimmed}"
unseen_anywhere   = "{dimmed}"
    """
    result += f"""    
[theme.delimiter]
open  = " ("
close = ") "
focused           = "{highlight}"
visible_elsewhere = "{color1}"
unseen_here       = "{color1}"
unseen_anywhere   = "{color2}"
    """
    result += f"""
[theme.board]
struct  = "{color2}"
key     = "{color1}"
value   = "{dimmed}"
size    = "small"
open    = "{{"
close   = "}}"
equal   = "="
    """
    return result


# !SUBSECTION! Generating matching waybar widgets
# !------------------------

def format_clock(highlight: str, color1: str, color2: str, dimmed: str) -> str:
    return f""" "{{:<span color='{color1}'> (</span><span color='{color2}'>%A %Y/%m/%d</span> <span color='{color2}'>%H:%M</span><span color='{color1}'>) </span>}}" """


def format_battery(highlight: str, color1: str, color2: str, dimmed: str) -> str:
    return f""" "<span color='{color1}'> (</span><span color='{color1}'>bat</span> <span color='{color2}'>{{capacity}}</span><span color='{color1}'>) </span>" """


def format_lightness(highlight: str, color1: str, color2: str, dimmed: str) -> str:
    return f""""<span color='{color1}'> (</span><span color='{color1}'>lgt</span> <span color='{color2}'>{{percent}}</span><span color='{color1}'>) </span>" """


# !SUBSECTION!  Waybar CSS



# !SECTION! Main function
# !====================


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="etabli")
    # color arguments
    parser.add_argument("--focus", type=str, default="#C00000",
                        help="Focused color")
    parser.add_argument("--ontop", type=str, default="#AAAAAA",
                        help="Main content color")
    parser.add_argument("--text", type=str, default="#B0B0B0",
                        help="Secondary content color")
    parser.add_argument("--dimmed", type=str, default="#505070",
                        help="Dimmed color")
    parser.add_argument("--background", type=str, default="#222222",
                        help="Dimmed color")
    parser.add_argument("--symbol_open", type=str, default=" (",
                        help="The symbol opening a group/level")
    parser.add_argument("--symbol_close", type=str, default=") ",
                        help="The symbol closing a group/level")
    # selecting what to display
    parser.add_argument("--etabli", action="store_true",
                        help="Whether to print the .etabli.toml content")
    parser.add_argument("--waybar_battery", action="store_true",
                        help="Whether to print a battery widget for waybar")
    parser.add_argument("--waybar_clock", action="store_true",
                        help="Whether to print a clock widget for waybar")
    parser.add_argument("--waybar_light", action="store_true",
                        help="Whether to print a screen lightness widget for waybar")
    # returning the result
    return parser.parse_args()


def main_cli() -> None:
    args = parse_args()
    if args.etabli:
        print(etabli_waybar(args.focus, args.ontop, args.text, args.dimmed))
    elif args.waybar_battery:
        print(format_battery(args.focus, args.ontop, args.text, args.dimmed))
    elif args.waybar_clock:
        print(format_clock(args.focus, args.ontop, args.text, args.dimmed))
    elif args.waybar_light:
        print(format_lightness(args.focus, args.ontop, args.text, args.dimmed))


if __name__ == "__main__":
    main_cli()
