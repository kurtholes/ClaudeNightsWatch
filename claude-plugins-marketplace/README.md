# Claude Productivity Plugins Marketplace

A curated collection of high-quality Claude Code plugins designed to enhance productivity, automation, and development workflows.

## 🚀 Quick Start

### Add Marketplace to Claude Code

```bash
claude plugins marketplace add https://github.com/aniketkarne/claude-plugins-marketplace
```

### Browse and Install Plugins

```bash
# Browse available plugins
claude plugins

# Install a specific plugin
claude plugins add claude-nights-watch
```

## 📦 Available Plugins

### 🔥 Claude Nights Watch
**Autonomous task execution daemon for Claude CLI**

Transform Claude from an interactive assistant into an autonomous worker that executes tasks automatically every 5 hours.

**Install:**
```bash
claude plugins add claude-nights-watch
```

**Features:**
- 🤖 **Autonomous Execution**: Runs tasks without manual intervention
- ⏰ **Smart Timing**: Monitors Claude usage windows and executes before expiry
- 🛡️ **Safety Rules**: Comprehensive safety constraints for autonomous operation
- 📊 **Full Logging**: Complete audit trail of all executions
- 🎯 **7 Slash Commands**: `/nights-watch start/stop/status/logs/task/setup/restart`
- 🧠 **AI Agent**: Built-in Task Executor for autonomous guidance
- 🔗 **MCP Server**: 8 programmatic tools for Claude control
- 🎣 **Smart Hooks**: Automatic session integration

**Quick Start:**
```bash
# Install plugin
claude plugins add claude-nights-watch

# Run interactive setup
/nights-watch setup

# Start daemon
/nights-watch start

# Monitor execution
/nights-watch logs -f
```

**Perfect for:**
- Daily development tasks (linting, testing, reporting)
- Continuous code reviews
- Automated documentation generation
- Data processing pipelines
- CI/CD automation
- Scheduled maintenance tasks

[📖 Full Documentation](https://github.com/aniketkarne/ClaudeNightsWatch) | [⭐ GitHub](https://github.com/aniketkarne/ClaudeNightsWatch)

---

## 🤝 Contributing

Want to add your plugin to this marketplace?

### Submission Guidelines

1. **Plugin Requirements:**
   - Must be in a public Git repository
   - Must include `.claude-plugin/plugin.json` manifest
   - Must follow Claude Code plugin specifications
   - Must be well-documented with examples
   - Must include safety documentation for autonomous tools

2. **Submission Process:**
   - Fork this marketplace repository
   - Add your plugin to `plugins.json`
   - Follow the plugin entry schema format
   - Include comprehensive description and metadata
   - Submit a pull request

3. **Review Process:**
   - Code review for safety and functionality
   - Documentation verification
   - Community feedback period
   - Final approval and merge

### Plugin Entry Schema

```json
{
  "name": "your-plugin-name",
  "repository": "https://github.com/you/your-plugin",
  "description": "Brief one-line description",
  "longDescription": "Detailed description with features and benefits",
  "version": "1.0.0",
  "author": "Your Name",
  "homepage": "https://your-docs-site.com",
  "license": "MIT",
  "keywords": ["tag1", "tag2"],
  "categories": ["category1"],
  "features": ["Feature 1", "Feature 2"],
  "requirements": {
    "claude": ">=1.0.0"
  },
  "documentation": "https://...",
  "featured": false,
  "verified": false
}
```

## 📊 Plugin Statistics

| Plugin | Version | Status | Downloads | Rating |
|--------|---------|--------|-----------|--------|
| **Claude Nights Watch** | 1.0.0 | ✅ Active | 0 | ⭐⭐⭐⭐⭐ |

## 🔄 Updates

### For Users
```bash
# Update all plugins from marketplace
claude plugins update

# Update marketplace list
claude plugins marketplace update
```

### For Maintainers
```bash
# Update plugin version in plugins.json
# Commit and push changes
git add plugins.json
git commit -m "Update claude-nights-watch to v1.1.0"
git push
```

## 📞 Support

### For Users
- **Plugin Issues**: Contact the plugin author or open an issue on their repository
- **Marketplace Issues**: Open an issue on this repository
- **General Help**: Check Claude Code documentation

### For Developers
- **Plugin Development**: [Claude Code Plugin Documentation](https://docs.anthropic.com/claude-code/plugins)
- **Plugin Reference**: [Plugin API Reference](https://docs.anthropic.com/claude-code/plugins-reference)
- **Community**: [Claude Discord](https://discord.gg/claude)

## 📄 License

This marketplace is MIT licensed. Individual plugins may have different licenses - check each plugin's repository for details.

## 🙏 Acknowledgments

- **Claude Code Team**: For the excellent plugin system
- **Plugin Authors**: For their contributions to the ecosystem
- **Community**: For feedback and support

---

**Enhance your Claude Code experience with powerful plugins! 🚀**

*Made with ❤️ for the Claude developer community*

