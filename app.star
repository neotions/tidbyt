load("render.star", "render")

def main():
    return render.Root(
        render.Box(
            width=64,
            height=32,
            color="#000000",
            child=render.Text(
                content="Hello, Tidbyt!",
                font="6x12",
                color="#FFFFFF",
                alignment="middle",
            ),
        )
    )

main()
