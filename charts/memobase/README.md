# Memobase Helm Chart

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/memobase)](https://artifacthub.io/packages/search?repo=memobase)

A user profile-based memory system designed to bring long-term user memory to your Generative AI (GenAI) applications

**Homepage:** <https://github.com/memodb-io/memobase>

## Source Code

* <https://github.com/memodb-io/memobase>
* <https://github.com/memodb-io/memobase-helm>

## Prerequisites

- Helm v3+

## Get the Chart

Add the Memobase Helm repository:

```bash
helm repo add memobase-repo https://memodb-io.github.io/memobase-helm
helm repo update
```

## Installing the Chart

To install the chart with the release name `my-memobase`:

```bash
helm install my-memobase memobase-repo/memobase \
  --set core.config.llm_api_key="" \
  --set core.config.embedding_api_key=""
```

**Note** that installing this chart directly means it will use the [default template values](./values.yaml) for Memobase.

## Uninstalling the Chart

To uninstall the `my-memobase` deployment:

```bash
helm uninstall my-memobase
```

## Configuration

The following table lists the configurable parameters of the Memobase chart and their default values.

### General parameters

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| externalStorage.postgresql.enabled | bool | `false` |  |
| externalStorage.postgresql.secretManger.csiDriver | string | `"secrets-store.csi.k8s.io"` |  |
| externalStorage.postgresql.secretManger.enabled | bool | `false` |  |
| externalStorage.postgresql.secretManger.secretKey | string | `"pg_url"` |  |
| externalStorage.postgresql.secretManger.secretName | string | `"memobase-storage-secrets"` |  |
| externalStorage.postgresql.secretManger.secretProviderClass | string | `"memobase-aws-secrets"` |  |
| externalStorage.postgresql.url | string | `""` |  |
| externalStorage.redis.enabled | bool | `false` |  |
| externalStorage.redis.secretManger.csiDriver | string | `"secrets-store.csi.k8s.io"` |  |
| externalStorage.redis.secretManger.enabled | bool | `false` |  |
| externalStorage.redis.secretManger.secretKey | string | `"redis_url"` |  |
| externalStorage.redis.secretManger.secretName | string | `"memobase-storage-secrets"` |  |
| externalStorage.redis.secretManger.secretProviderClass | string | `"memobase-aws-secrets"` |  |
| externalStorage.redis.url | string | `""` |  |
| global.image.pullPolicy | string | `"IfNotPresent"` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts | list | `[]` |  |
| ingress.ingressClassName | string | `""` |  |
| postgresql.database | string | `"memobase"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.password | string | `"postgres"` |  |
| postgresql.persistence.enabled | bool | `false` |  |
| postgresql.persistence.size | string | `"1Gi"` |  |
| postgresql.persistence.storageClass | string | `""` |  |
| postgresql.port | int | `5432` |  |
| postgresql.resources | object | `{}` |  |
| postgresql.username | string | `"postgres"` |  |
| redis.enabled | bool | `true` |  |
| redis.password | string | `"memobase"` |  |
| service.annotations | object | `{}` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |

### Core Configuration

llm_api_key and embedding_api_key (if enable_event_embedding is true) are required.

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| core.accessToken | string | `"token"` |  |
| core.adminToken | string | `"token"` |  |
| core.adminUrl | string | `""` |  |
| core.affinity | object | `{}` |  |
| core.annotations | object | `{}` |  |
| core.config.additional_user_profiles | list | `[]` |  |
| core.config.best_llm_model | string | `"gpt-4o-mini"` |  |
| core.config.buffer_flush_interval | int | `3600` |  |
| core.config.cache_user_profiles_ttl | int | `1200` |  |
| core.config.embedding_api_key | string | `""` |  |
| core.config.embedding_base_url | string | `""` |  |
| core.config.embedding_dim | int | `1536` |  |
| core.config.embedding_max_token_size | int | `8192` |  |
| core.config.embedding_model | string | `"text-embedding-3-small"` |  |
| core.config.embedding_provider | string | `"openai"` |  |
| core.config.enable_event_embedding | bool | `true` |  |
| core.config.enable_event_summary | bool | `true` |  |
| core.config.event_tags | list | `[]` |  |
| core.config.language | string | `"en"` |  |
| core.config.llm_api_key | string | `""` |  |
| core.config.llm_base_url | string | `"https://api.openai.com/v1/"` |  |
| core.config.llm_style | string | `"openai"` |  |
| core.config.llm_tab_separator | string | `"::"` |  |
| core.config.max_chat_blob_buffer_token_size | int | `1024` |  |
| core.config.max_pre_profile_token_size | int | `128` |  |
| core.config.max_profile_subtopics | int | `15` |  |
| core.config.minimum_chats_token_size_for_event_summary | int | `256` |  |
| core.config.overwrite_user_profiles | list | `[]` |  |
| core.config.persistent_chat_blobs | bool | `false` |  |
| core.config.profile_strict_mode | bool | `false` |  |
| core.config.profile_validate_mode | bool | `true` |  |
| core.config.summary_llm_model | string | `""` |  |
| core.config.system_prompt | string | `""` |  |
| core.config.telemetry_deployment_environment | string | `"local"` |  |
| core.config.use_timezone | string | `""` |  |
| core.hpa.enabled | bool | `false` |  |
| core.hpa.maxReplicas | int | `5` |  |
| core.hpa.minReplicas | int | `1` |  |
| core.hpa.targetCPUUtilizationPercentage | int | `80` |  |
| core.hpa.targetMemoryUtilizationPercentage | int | `80` |  |
| core.image.repository | string | `"ghcr.io/memodb-io/memobase"` |  |
| core.image.tag | string | `""` |  |
| core.lifecycle | object | `{}` |  |
| core.logFormat | string | `"json"` |  |
| core.name | string | `"memobase"` |  |
| core.nodeSelector | object | `{}` |  |
| core.pdb.enabled | bool | `false` |  |
| core.pdb.minAvailable | int | `1` |  |
| core.projectId | string | `"memobase"` |  |
| core.prometheus.enabled | bool | `false` |  |
| core.replicaCount | int | `1` |  |
| core.resources.limits.cpu | string | `"500m"` |  |
| core.resources.limits.memory | string | `"1Gi"` |  |
| core.resources.requests.cpu | string | `"250m"` |  |
| core.resources.requests.memory | string | `"256Mi"` |  |
| core.terminationGracePeriodSeconds | int | `30` |  |
| core.tolerations | list | `[]` |  |
| core.topologySpreadConstraints | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs](https://github.com/norwoodj/helm-docs)
