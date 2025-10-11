# Claude Nights Watch Marketplace

Official marketplace for Claude Nights Watch and related productivity plugins for Claude Code.

## 🚀 Installation

Add this marketplace to your Claude Code:

```bash
claude plugins marketplace add https://github.com/aniketkarne/claude-plugins-marketplace
```

## 📦 Available Plugins

### Claude Nights Watch

**Autonomous task execution daemon for Claude CLI**

Transform Claude from an interactive assistant into an autonomous worker that executes tasks automatically every 5 hours.

**Install:**
```bash
claude plugins add claude-nights-watch
```

**Key Features:**
- 🤖 Autonomous task execution
- ⏰ Smart usage window monitoring  
- 🛡️ Comprehensive safety rules
- 📊 Full audit logging
- 🎮 7 slash commands
- 🤖 Specialized Task Executor agent
- 🔌 MCP server integration
- 📅 Scheduled execution

**Quick Start:**
```bash
# Install plugin
claude plugins add claude-nights-watch

# Run setup
/nights-watch setup

# Start daemon
/nights-watch start

# Monitor
/nights-watch logs -f
```

**Documentation:**
- [Full Installation Guide](https://github.com/aniketkarne/ClaudeNightsWatch/blob/main/PLUGIN_INSTALLATION.md)
- [Plugin README](https://github.com/aniketkarne/ClaudeNightsWatch/blob/main/PLUGIN_README.md)
- [Main Documentation](https://github.com/aniketkarne/ClaudeNightsWatch/blob/main/README.md)

**Use Cases:**
- Daily development tasks (linting, testing, reporting)
- Continuous code reviews
- Automated documentation generation
- Data processing pipelines
- ETL workflows
- CI/CD automation
- Scheduled maintenance tasks

**Safety:**
- Comprehensive rules system
- Full execution logging
- Test suite included
- Example templates provided
- Progressive complexity approach

[Learn More →](https://github.com/aniketkarne/ClaudeNightsWatch)

---

## 🤝 Contributing

Want to add your plugin to this marketplace?

### Submission Guidelines

1. **Plugin must:**
   - Be in a public Git repository
   - Include `.claude-plugin/plugin.json` manifest
   - Follow Claude Code plugin specifications
   - Be well-documented with examples
   - Include safety documentation

2. **Submit a Pull Request:**
   - Fork this repository
   - Add your plugin to `plugins.json`
   - Follow the schema format
   - Include comprehensive description
   - Link to documentation

3. **Review Process:**
   - Code review for safety
   - Functionality testing
   - Documentation review
   - Community feedback

### Plugin Entry Template

```json
{
  "name": "your-plugin-name",
  "repository": "https://github.com/you/your-plugin",
  "description": "Brief one-line description",
  "longDescription": "Detailed description with features and benefits",
  "version": "1.0.0",
  "author": "Your Name",
  "homepage": "https://...",
  "license": "MIT",
  "keywords": ["tag1", "tag2"],
  "categories": ["category1"],
  "features": ["feature 1", "feature 2"],
  "documentation": "https://..."
}
```

## 📊 Plugin Statistics

| Plugin | Version | Downloads | Rating |
|--------|---------|-----------|--------|
| claude-nights-watch | 1.0.0 | - | ⭐⭐⭐⭐⭐ |

## 🔄 Updates

To update your installed plugins:

```bash
claude plugins update
```

## 📞 Support

### For Marketplace Issues
Open an issue on this repository: [GitHub Issues](https://github.com/aniketkarne/claude-plugins-marketplace/issues)

### For Plugin-Specific Issues
Contact the plugin author or open an issue on their repository.

### Community
- Discord: [Claude Community](https://discord.gg/claude)
- Discussions: [GitHub Discussions](https://github.com/aniketkarne/claude-plugins-marketplace/discussions)

## 📄 License

This marketplace is MIT licensed. Individual plugins may have different licenses - check each plugin's repository.

## 🙏 Acknowledgments

- Claude Code team for the excellent plugin system
- Plugin authors for their contributions
- Community for feedback and support

---

**Enhance your Claude Code experience with powerful plugins! 🚀**

