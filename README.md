Dependencies  
  Brew  
  Mkcert  
  Sudo access  
  Docker desktop  

Configuration  
  In the root folder is a .env file. For the initial setup, update the DOCKERUSER, DOCKERGROUP and DOCKERUSERID to match your local account.  
  Navigate to the SSL folder. cs site/ssl and generate the following SSL files. For this example we are using the STACKDOMAIN appmerc set up in the .env file.  
  Example:  
    mkcert dbadmin.test  
    mkcert api.appmerc.test  
    mkcert llm.appmerc.test  
    mkcert n8n.appmerc.test  
  The build will create the structure SUBDOMAIN.STACKDOMAIN.test  
    
  Using the above domains in the example hosts file entry  
    127.0.0.1 api.appmerc.test  
    127.0.0.1 llm.appmerc.test  
    127.0.0.1 n8n.appmerc.test  
    127.0.0.1 dbadmin.test  

  Set your local environment path for Docker and the bin folder  
  export PATH=$PATH:~/LlamaDocker  
  export PATH=$PATH:~/LlamaDocker/bin  
  Exit and reload your terminal  
Build  
  In the root folder run bin/dockerbuild  
  To drop the cluster run bin/dockerdown  
    
Scripts  
  bin/dphp82 - Allows user to enter php82 environment  
  bin/dphp83 - Allows user to enter php83 environment  
  bin/dphp84 - Allows user to enter php84 environment  
  bin/dmysql - Allows user to enter MySQL environment  
  bin/dnginx - Allows user to enter Nginx environment  
  bin/dllama - Allows user to enter Ollama LLM environment   

Ollama - https://ollama.com/  
  Recomended model for 16GB ram - https://ollama.com/library/llama3.2:3b  
