# Linux Real-World Project

A Linux automation project focused on provisioning and validating a simulated company environment using Bash scripting.

This project was inspired by the work of [@welsaid_](https://x.com/welsaid_) and expanded as part of my Linux and Cloud Computing training journey.

## Project Overview

The goal of this project was to automate the setup of a structured Linux environment representing a company organization.

The script provisions:

* Department directories
* Linux groups
* User accounts
* Primary and secondary group memberships
* Directory ownership and permissions
* Department files

A validation script was also created to verify that the server matches the expected configuration.

## What I Built

### Provisioning Script

The setup script automates:

* Creating organizational departments:

  * Engineering
  * Finance
  * HR
  * Management
  * Shared

* Creating Linux groups:

  * Developers
  * Finance
  * HR
  * Management
  * Shared

* Creating users and assigning:

  * Primary groups
  * Shared group access

* Applying directory security:

```
2770 permissions
setgid inheritance
group-based ownership
```

### Validation Script

The validation script checks:

* Base directory existence
* Department creation
* User existence
* Primary group assignments
* Shared group membership
* Directory ownership
* Directory permissions
* Required files

## Key Concepts Practiced

* Bash scripting
* Functions
* Loops
* Indexed arrays
* Associative arrays
* Linux users and groups
* File permissions
* Ownership management
* System validation

## Lessons Learned

The biggest lesson from this project was understanding how Linux automation is not only about executing commands but about managing system state.

Key takeaways:

* Use arrays for collections.
* Use associative arrays for relationships.
* Separate provisioning from validation.
* Always verify automation results.

## Future Improvements

Planned improvements:

* Add idempotent execution
* Add structured logging
* Improve error handling
* Convert the workflow into an Ansible playbook

## Author

Daniel Emeke Okuguni
Cloud Computing Student | Linux | DevOps
