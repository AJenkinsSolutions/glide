export const version = '0.1.0';

// From dist/Glide.app: LSMinimumSystemVersion is 15.0 and the binary is arm64 only.
// Switch `chips` to 'Apple Silicon and Intel' once releases are universal.
export const macos = 'macOS 15 or later';
export const chips = 'Apple Silicon';

export const repo = 'https://github.com/michaelshimeles/glide';
export const dmg = `${repo}/releases/latest/download/Glide-universal.dmg`;
