use std::fs;
use zed_extension_api::{self as zed, LanguageServerId, Result, Worktree};

const PYTHON_PATHS: &[&str] = &[
    "/opt/homebrew/bin/python3",
    "/usr/local/bin/python3",
    "/usr/bin/python3",
];

struct CpyteExtension;

impl CpyteExtension {
    fn find_python() -> std::result::Result<String, String> {
        for path in PYTHON_PATHS {
            if fs::metadata(path).is_ok() {
                return Ok(path.to_string());
            }
        }

        Err(
            "Python 3 is not installed or not found at any of the expected paths:\n{}\n\n\
             Please install Python 3:\n  brew install python3\n  — or —\n  https://www.python.org/downloads/"
                .replace("{}", &PYTHON_PATHS.iter().map(|p| format!("  {p}")).collect::<Vec<_>>().join("\n"))
        )
    }
}

impl zed::Extension for CpyteExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        _worktree: &Worktree,
    ) -> Result<zed::Command> {
        let python_path = Self::find_python()?;

        Ok(zed::Command {
            command: python_path,
            args: vec!["-m".into(), "cpyte.lsp_server".into()],
            env: vec![],
        })
    }
}

zed::register_extension!(CpyteExtension);
