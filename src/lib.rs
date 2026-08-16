use zed_extension_api::{
    self as zed,
    LanguageServerId,
    Result,
    Worktree,
};

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
            command: "python".to_string(),
            args: vec![
                "-m".to_string(),
                "cpyte.lsp_server".to_string(),
            ],
            env: vec![],
        })
    }
}

zed::register_extension!(CpyteExtension);
