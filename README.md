w_jenkins_ruby Cookbook
==================

Chef cookbook to instal and configure jenkins and ruby. Expects setting up CI server for cookbook testing and deployment as a chef workstation.

Requirements
------------
Cookbook Dependency:

* java
* jenkins
* ruby-install

Supported Platform:
Ubuntu 14.04, Ubuntu 12.04

Usage
-----
#### w_jenkins_ruby::default

Include with `w_common` in your node/role's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[w_common]",
    "recipe[w_jenkins_ruby]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Install reqired gems
```
bundle install
```
4. Write your change
5. Write tests for your change (if applicable)
6. Run the tests, ensuring they all pass
```
bundle exec rspec
bundle exec kithen test
```
7. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 
* Joel Handwell @joelhandwell 
* Full Of Lilies @fulloflilies
