use zed_extension_api::{self as zed, LanguageServerId, Result, Worktree};

struct CpyteExtension;

impl zed::Extension for CpyteExtension {
    fn new() -> Self {
        Self
    }

    fn language_server_command(
        &mut self,
        _language_server_id: &LanguageServerId,
        _worktree: &Worktree,
    ) -> Result<zed::Command> {
        Ok(zed::Command {
            command: "/opt/homebrew/bin/python3".into(),
            args: vec!["-m".into(), "cpyte.lsp_server".into()],
            env: vec![],
        })
    }
}

zed::register_extension!(CpyteExtension);
