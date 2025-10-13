---
layout: blog
title: How to Set Up an MCP Registry for GitHub Copilot
date: 2025-10-13T11:15:28Z
thumbnail: /img/mcp-registry-setup.png
---

## Introduction

As organizations adopt AI-powered development tools like GitHub Copilot, maintaining security and governance becomes increasingly critical. The Model Context Protocol (MCP) enables Copilot to connect with external tools and data sources, but without proper controls, this connectivity can pose security risks. **An MCP Registry provides enterprises with centralized control over which MCP servers and APIs their developers can access**, ensuring that sensitive data and systems remain protected while still leveraging AI capabilities.

By implementing an MCP Registry, organizations can:

- **Control access**: Restrict Copilot to only approved, vetted MCP servers
- **Maintain compliance**: Ensure all AI-enhanced development activities align with security policies
- **Monitor usage**: Track which APIs and tools are being accessed through Copilot
- **Protect sensitive data**: Prevent accidental exposure of proprietary APIs or internal systems

In this guide, we'll walk through setting up an MCP Registry using Azure API Center and configuring GitHub Copilot to use it, giving your organization the security controls needed for safe AI-assisted development.


## Part 1: Set Up an MCP Registry with Azure API Center

First, we'll follow the steps outlined in the [official Microsoft documentation](https://learn.microsoft.com/en-us/azure/api-center/register-discover-mcp-server) to create an MCP-compatible API registry. This involves using Azure API Center, which can serve as a fully-featured MCP server.

### Prerequisites

*   **An Azure subscription** with contributor-level access or higher. If you don't have one, you can [create a free account](https://azure.microsoft.com/free/) which includes $200 in credits for 30 days.
*   **Permissions to create resources** in your Azure subscription, specifically the ability to create Azure API Center instances in your chosen resource group.
*   **Basic familiarity with the Azure Portal** and navigating Azure resource management interfaces.
*   **(Optional) Azure CLI installed** for automation or scripting purposes. You can install it following the [official guide](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli).

**Estimated time to complete:** 15-20 minutes

### Steps

1.  **Create an Azure API Center**:
    *   Navigate to the Azure portal and search for "API Center".
    *   Click "Create" and fill in the required details for your new API Center instance.

2.  **Register MCP Servers**:
    *   Once your API Center is deployed, you can start registering your existing MCP-compliant servers.

3. **Enable API Center Portal**:
    *   Under the "API Center Portal" > "Settings" section, enable the portal. This will not only allow you to manage and view your registered MCP servers through a user-friendly interface, but also ensure that the MCP endpoint is properly configured and accessible.
    *   In the Visibility section, check the option "Allow "anonymous" access", otherwise GitHub Copilot won't be able to access the MCP registry.

4.  **Expose the MCP Endpoint**:
    *   Azure API Center automatically provides an MCP-compatible endpoint. You can find this endpoint URL in the API Center's overview page in the Azure portal. It will look something like this: `https://<your-api-center-name>.data.<location>.azure-apicenter.ms/workspaces/default/v0/servers`.

By the end of this part, you will have a functional MCP server URL ready to be used by clients like GitHub Copilot.

## Part 2: Register the MCP Registry in GitHub Copilot

Now that you have your MCP server, you need to configure GitHub Copilot to use it. This is done by defining MCP Server access in your GitHub organization or enterprise settings, as detailed in the [GitHub documentation](https://docs.github.com/en/copilot/how-tos/administer-copilot/configure-mcp-server-access).

### Prerequisites

Before configuring GitHub Copilot, verify you have:

*   **Organization owner or enterprise administrator role** in your GitHub organization. If you're unsure of your role, check your organization's "People" settings.
*   **GitHub Copilot Business or Enterprise subscription** active for your organization. GitHub Copilot Individual subscriptions do not support MCP registry configuration.
*   **The MCP endpoint URL** from Part 1 (format: `https://<your-api-center-name>.data.<location>.azure-apicenter.ms/workspaces/default/v0/servers`).
*   **Access to your GitHub organization settings**, specifically the "Copilot" section under organization settings.

**Note:** Changes to MCP server policies may take up to 15 minutes to propagate to all users in your organization.

**Estimated time to complete:** 5-10 minutes

### Steps

1.  **MCP servers policy**:
    *   Setup MCP servers policy to **Enabled**

2.  **MCP Registry URL**:
    The MCP Registry URL is an optional field.
    *   You can enter the MCP endpoint URL you obtained from your Azure API Center in Part 1.

3.  **Restrict MCP access to registry servers**:
    *   Set this to **Registry only** to ensure that Copilot only accesses the APIs you have registered.

## Conclusion

You've now successfully set up an MCP Registry using Azure API Center and integrated it with GitHub Copilot. Your developers can now leverage your organization's API definitions directly in their coding environment.

### Next Steps

- Register additional APIs in your API Center
- Create documentation for your team on using the MCP-enhanced Copilot
- Set up monitoring and analytics for API discovery usage
- Explore advanced MCP features like custom tools and prompts

## Additional Resources

- [Azure API Center Documentation](https://learn.microsoft.com/azure/api-center/)
- [Model Context Protocol Specification](https://spec.modelcontextprotocol.io/)
- [GitHub Copilot MCP Integration](https://docs.github.com/copilot)