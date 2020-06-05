Continuous Integration & Deployment
===================================

Continuous Integration
----------------------

We run CI tasks in docker:

```bash
cd ci
make ci
```

This will execute build & test sequence.

If you want to ignore failed tests set `IGNORE_FAILED_TESTS` environment variable to `True`.
