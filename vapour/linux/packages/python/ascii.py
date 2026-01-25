import pyfiglet
import sys

def text_to_ascii_art(text):
    """Converts a given string into ASCII art using pyfiglet."""
    # Create the ASCII art
    # 'standard' is the default font, you can explore others like 'banner', 'big', etc.
    ascii_art = pyfiglet.figlet_format(text, font="standard")
    return ascii_art

if __name__ == "__main__":
    # Check if text was provided as command-line argument
    if len(sys.argv) > 1:
        input_text = " ".join(sys.argv[1:])
    else:
        # Prompt user for input if not provided via command line
        input_text = input("Enter text to convert to ASCII art: ")

    if input_text:
        art = text_to_ascii_art(input_text)
        print("\n--- ASCII Art Output ---")
        print(art)
        print("------------------------")
    else:
        print("No text entered. Exiting.")

