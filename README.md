# APISpringBoot
- Project Name:ApiSpringBoot
  + Backend of the shop, but i just Crud some models (tables in the database).

- Features:
  + Crud model Product, Category, Color, Size, Image.

- Requirements:
  + Eclipse Java (all versions) to code
    + + link download Eclipse for Windown: https://www.eclipse.org/downloads/
  + MySql: At project, I use Mysql Workbench version 8.0.13
    + + link download Mysql Workbench version 8.0.33 (latest): https://dev.mysql.com/downloads/workbench/?os=src
  + PostMan (all versions) to make requests
    + + link download PostMan for Window: https://www.postman.com/downloads/

- Installation:
  Project on Eclipse:
  + Clone the repository: git clone https://github.com/thong-ltv/APISpringBoot.git
  + Then, on Eclipse, click "File" -> Import -> ApiSpringBoot (name of project) -> General -> Projects from Folder or Archive -> Next -> choose Project from import source -> finish.
  + To run project, click right on project -> run as -> Java Application.
  file RestFullAPISpringBoot.postman_collection.json to import into postman:
  + Login (your postman)
  + Click Workspaces -> Collection -> Import -> upload file RestFullAPISpringBoot.postman_collection.json
  MySql:shopping.sql
  + Open MySql Work Bench -> login -> Server -> Data Import -> choose Import from Self-Contained File -> Start Import
  
- Usage:
  + First, run Project on Eclipse.
  + Access to postman.com, then Workspaces -> MY Workspace -> Collection -> choose ApiSpringBoot -> choose request that you want to test.
  Default, button "Send" hidden, you must click on icon PostMan on Your Desktop -> Send.
