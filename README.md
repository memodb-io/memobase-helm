# memobase-helm

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/memobase)](https://artifacthub.io/packages/search?repo=memobase)

```bash
$ helm repo add memobase-repo https://memodb-io.github.io/memobase-helm/
$ helm upgrade --install memobase memobase-repo/memobase --set core.config.llm_api_key="" --set core.config.embedding_api_key=""
```
