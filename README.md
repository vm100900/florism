# Florism

**Florism** is a fork of Flutter focused on bringing glassmorphism to everyone with a simple, easy-to-use widget. Create beautiful, modern glassmorphic cards and surfaces by simply wrapping your widgets—no complicated setup required.

---

## ✨ Features

- Effortless glassmorphic UI for your Flutter apps
- Just wrap any widget to apply a glass effect
- Highly customizable: color, blur, opacity, border, and more
- Seamless integration with existing Flutter code

---

## 🚀 Quick Start

Add Florism to your Flutter project (see [Installation](#installation) below).

Then, use `GlassmorphicContainer` like this:

```dart
GlassmorphicContainer(
  color: Colors.white.withOpacity(0.2),
  padding: EdgeInsets.all(16),
  alignment: Alignment.center,
  child: Text(
    'Hello, Glass!',
    style: TextStyle(fontSize: 20, color: Colors.white),
  ),
)
```

---

## 📦 Installation

1. Download this repository in the directory you want your Florism SDK to live:
   ```sh
   git clone https://github.com/vm100900/florism.git
   ```

2. Add Flutter (or Florism) to your system PATH so you can run it from any terminal.

---

## 🛠️ Add Flutter to PATH

### Windows

1. Press `Win + S`, search for **Environment Variables**, and open it.
2. Click **"Edit the system environment variables"**
3. In the System Properties window, click **Environment Variables**
4. Under **System variables** or **User variables**, find `Path`, click **Edit**
5. Add a new entry:
   ```
   C:\florism\bin
   ```
6. Click **OK** on all dialogs to apply.

### macOS / Linux

1. Open your terminal and open your shell config file based on what you're using:

   - Bash: `nano ~/.bashrc`
   - Zsh: `nano ~/.zshrc`
   - Fish: `nano ~/.config/fish/config.fish`

2. Add the following line (adjust path accordingly):

   ```sh
   export PATH="$PATH:$HOME/florism/bin"
   ```

3. Save the file and reload the terminal or run:

   ```sh
   source ~/.bashrc  # or ~/.zshrc or ~/.fish
   ```

---

### ✅ Verify Setup

Open a new terminal and run:

```sh
flutter doctor
```

You should see Florism validating your environment.

### (Optional) Add Dart to PATH

Also add (if needed):

```sh
export PATH="$PATH:$HOME/florism/bin/cache/dart-sdk/bin"
```

---

## 🎨 Customization

You can customize the glass effect using the widget’s parameters:
- `color`: The background color (with opacity)
- `blur`: Adjust the blur intensity
- `borderRadius`: Round the corners
- `border`: Add gradient or solid borders

---

## 🧪 Example

```dart
GlassmorphicContainer(
  width: 300,
  height: 200,
  borderRadius: 20,
  blur: 15,
  border: 2,
  alignment: Alignment.center,
  color: Colors.white.withOpacity(0.2),
  borderGradient: LinearGradient(
    colors: [Colors.white, Colors.blue.shade100.withOpacity(0.3)],
  ),
  child: Text(
    'Glassmorphism for the win!',
    style: TextStyle(fontSize: 24, color: Colors.white),
  ),
)
```

---

## 🧊 About Glassmorphism

Glassmorphism is a popular UI trend featuring frosted-glass-like surfaces, soft gradients, and subtle borders. Florism makes it easy to implement this effect in Flutter.

---

## 🤝 Contributing

Contributions are welcome! Please open issues or submit pull requests for features, bugfixes, or documentation improvements.

---

## 📄 License

BSD 3-Clause License. See [LICENSE](LICENSE) for details.

---

> Forked from Flutter with a focus on next-level UI.
