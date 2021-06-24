<!-- Description -->
## Description
This HelloID Service Automation Delegated Form provides AD computer delete functionality. The following options are available:
 1. Search and select the target AD computer
 2. Show basic AD computer attributes of selected target computer
 4. Delete the selected target AD computer
 
<!-- TABLE OF CONTENTS -->
## Table of Contents
* [Description](#description)
* [All-in-one PowerShell setup script](#all-in-one-powershell-setup-script)
  * [Getting started](#getting-started)
* [Post-setup configuration](#post-setup-configuration)
* [Manual resources](#manual-resources)


## All-in-one PowerShell setup script
The PowerShell script "createform.ps1" contains a complete PowerShell script using the HelloID API to create the complete Form including user defined variables, tasks and data sources.

 _Please note that this script asumes none of the required resources do exists within HelloID. The script does not contain versioning or source control_


### Getting started
Please follow the documentation steps on [HelloID Docs](https://docs.helloid.com/hc/en-us/articles/360017556559-Service-automation-GitHub-resources) in order to setup and run the All-in one Powershell Script in your own environment.

## Manual resources
This Delegated Form uses the following resources in order to run

### Powershell data source 'AD-computer-generate-table-wildcard'
This Powershell data source runs an Active Directory query to search for matching AD computer.

### Delegated form task 'ad-computer-delete'
This delegated form task will delete the selected target AD computer.

# HelloID Docs
The official HelloID documentation can be found at: https://docs.helloid.com/
