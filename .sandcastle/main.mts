import { fileURLToPath } from "node:url";
import { run, claudeCode } from "@ai-hero/sandcastle";
import { noSandbox } from "@ai-hero/sandcastle/sandboxes/no-sandbox";

// Simple loop: an agent that picks open `ready-for-agent` issues one by one
// and closes them. Run from anywhere with: npm --prefix .sandcastle run sandcastle

const repo = fileURLToPath(new URL("..", import.meta.url));

await run({
  // A name for this run, shown as a prefix in log output.
  name: "worker",

  // Glide only builds on macOS (ScreenCaptureKit, AppKit, Metal), so a Linux
  // container could edit the code but never compile or test it. The agent runs
  // on this Mac instead, isolated only by its own git worktree.
  sandbox: noSandbox(),

  // Without a container, "auto" has each tool call approved or denied by a
  // classifier instead of skipping permission checks altogether.
  agent: claudeCode("claude-opus-5-5", { permissionMode: "auto" }),

  // Anchor git operations and .sandcastle/ artifacts at the repo root.
  cwd: repo,
  promptFile: fileURLToPath(new URL("prompt.md", import.meta.url)),

  // Maximum number of iterations (agent invocations) to run in a session.
  // Each iteration works on a single issue.
  maxIterations: 3,

  // The agent works on a temporary branch in a worktree under
  // .sandcastle/worktrees/, and its commits are merged back to HEAD at the end.
  branchStrategy: { type: "merge-to-head" },

  // A cold build compiles whisper.cpp and wgpu and prints nothing for minutes.
  idleTimeoutSeconds: 1800,
});
