#!node
const theme = {
    "name": "Primer",
    "black": "#000000",
    "red": "#ea4a5a",
    "green": "#34d058",
    "yellow": "#ffdf5d",
    "blue": "#2188ff",
    "purple": "#8a63d2",
    "cyan": "#15e2e2",
    "white": "#ecf0f1",
    "brightBlack": "#4f5861",
    "brightRed": "#fdaeb7",
    "brightGreen": "#bef5cb",
    "brightYellow": "#fff5b1",
    "brightBlue": "#c8e1ff",
    "brightPurple": "#d1bcf9",
    "brightCyan": "#a2ecec",
    "brightWhite": "#ffffff",
    "background": "#1a2b3c",
    "foreground": "#ffffff"
}
const sequ = ["black", "red", "green", "yellow", "blue", "purple", "cyan", "white", 'brightBlack', 'brightRed', 'brightGreen', 'brightYellow', 'brightBlue', 'brightPurple', 'brightCyan', 'brightWhite']
const content = (i, v, n) => `[${i}] = "${v}", /* ${n} */`

const ret = sequ.map((ma, index) => content(index, theme[ma], ma))
ret.push(content(256, theme["background"], "specialBackground"))
ret.push(content(257, theme["foreground"], "specialForeground"))

console.log(ret.join("\n"));
