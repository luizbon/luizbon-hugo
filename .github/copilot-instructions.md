This is a Hugo-based static website. The primary purpose of this repository is to manage the content and configuration of a personal blog.

### Architecture

- **Static Site Generator:** The site is built using [Hugo](https://gohugo.io/).
- **Configuration:** The main configuration is in `config.toml`. This file controls site-wide settings, menus, and theme parameters.
- **Content:** All content is in the `content/` directory, written in Markdown.
  - Blog posts are located in `content/blog/`. Each post is a separate `.md` file.
  - Standalone pages like "About" are in the root of `content/`.
- **Theme:** The site uses the `cocoa` theme, located in `themes/cocoa/`. Customizations to the theme should be done carefully, as they might be overwritten by theme updates.
- **Static Assets:** Images, CSS, and other static files are in the `static/` directory. Images referenced in blog posts are typically in `static/img/`.

### Developer Workflow

**Creating a new blog post:**

1.  Create a new Markdown file in `content/blog/`. The filename will become the URL slug (e.g., `my-new-post.md` becomes `/blog/my-new-post/`).
2.  Add front matter to the top of the file. The front matter must include `title`, `date`, and `thumbnail`. For example:

    ```markdown
    ---
    layout: blog
    title: Are you prepared for your next job interview?
    date: 2019-09-23T11:47:51.299Z
    thumbnail: /img/interview-1714370_1920.jpg
    ---

    # Your post content starts here...
    ```

3.  Write the post content in Markdown.

**Running the site locally:**

To preview the site, you need to have Hugo installed. Then, run the following command:

```bash
hugo server
```

This will start a local development server, usually at `http://localhost:1313/`.

**Building the site:**

To generate the static files for deployment, run:

```bash
hugo
```

The output will be in the `public/` directory by default (as specified in `config.toml`).

### Conventions

- **Front Matter:** All content files must have front matter. For blog posts, `title`, `date`, and `thumbnail` are essential.
- **Image Paths:** When referencing images in `thumbnail` or in the body of a post, use a root-relative path (e.g., `/img/your-image.jpg`). This ensures that the images are correctly resolved.
- **Menu:** The main navigation menu is configured in `config.toml` under `[[menu.main]]`. To add or remove items, edit this section.
