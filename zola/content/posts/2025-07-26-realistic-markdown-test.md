+++
title = "A Realistic Markdown Example"
date = 2025-07-26
+++

# The Art of Writing Great Documentation

Good documentation is essential for any software project. It helps users understand how to use your software and enables contributors to get started quickly.

## Why Documentation Matters

Documentation serves several important purposes:

- It reduces the learning curve for new users
- It decreases support requests by answering common questions
- It helps maintain consistency across your project
- It enables community contributions

As [Joel Spolsky](https://www.joelonsoftware.com/) famously said:

> "Writing great documentation is harder than writing code."

## Common Documentation Patterns

### Getting Started Guide

A good getting started guide should be the first thing users see. Here's a simple example:

```bash
curl -fsSL https://example.com/install.sh | sh
```

This one-liner installs our tool on most Unix-like systems.

### Configuration

Most applications need configuration. Here's how ours works:

```yaml,linenos,linenostart=20,hl_lines=1 3-5 9,name=mod.rs
server:
  host: 0.0.0.0
  port: 8080
  ssl:
    enabled: true
    cert: /path/to/cert.pem
    key: /path/to/key.pem
```

### API Reference

Our REST API uses standard HTTP methods:

| Method | Endpoint | Description | Parameters | Auth Required | Response Code | Example | Rate Limit | Caching |
|--------|----------|-------------|------------|---------------|---------------|---------|------------|---------|
| GET | `/api/v1/users` | List all users | `page`, `limit`, `sort` | No | 200 | `{"users": [], "total": 0}` | 100/min | 60s |
| POST | `/api/v1/users` | Create a new user | `name`, `email` | Yes | 201 | `{"id": 1, "name": "John", "email": "john@example.com"}` | 10/min | None |
| GET | `/api/v1/users/{id}` | Get a specific user | `id` | No | 200 | `{"id": 1, "name": "John", "email": "john@example.com"}` | 100/min | 300s |
| PUT | `/api/v1/users/{id}` | Update a user | `id`, `name`, `email` | Yes | 200 | `{"id": 1, "name": "John Doe", "email": "john@example.com"}` | 10/min | None |
| DELETE | `/api/v1/users/{id}` | Delete a user | `id` | Yes | 204 | - | 10/min | None |

## Code Examples

Here's how to use our Python client:

```python
from myproject import Client

c = Client(api_key="your-key")
users = c.users.list()
for user in users:
    print(user.name)
```

And here's the same in JavaScript:

```javascript
const { Client } = require('myproject-client');

const c = new Client({ apiKey: 'your-key' });
c.users.list().then(users => {
  users.forEach(user => {
    console.log(user.name);
  });
});
```

## Tips for Better Documentation

> "The best documentation is the kind that people actually read. But great documentation goes beyond just being readable - it should be actionable, comprehensive, and maintainable.
>
> Consider this example of a well-documented API endpoint:
>
> ```python
> def create_user(name: str, email: str) -> User:
>     """
>     Create a new user in the system.
>
>     Args:
>         name: Full name of the user
>         email: Email address (must be unique)
>
>     Returns:
>         The created User object
>
>     Raises:
>         ValueError: If email is invalid
>         DuplicateEmailError: If email already exists
>     """
> ```
>
> Notice how the documentation includes:
>
> - Clear parameter descriptions
> - Expected return value
> - Possible exceptions
> - Type hints for better IDE support
>
> This level of detail helps developers understand not just what the function does, but how to use it correctly."

1. Write for your audience
2. Keep examples simple but realistic
3. Include both basic and advanced use cases
4. Update documentation when code changes[^3]

Great documentation doesn't happen by accident. It requires planning, writing, and maintenance—just like code. By treating documentation as a first-class citizen in your project, you'll create a better experience for everyone involved[^2].

[^2]: This is another example of a helpful footnote that provides additional context without interrupting the main content flow.

[^3]: This is another example of a helpful footnote that provides additional context without interrupting the main content flow.

Check out our [full documentation](https://example.com/docs) to learn more.
