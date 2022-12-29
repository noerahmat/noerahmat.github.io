```
graph LR
    A[CI] -->|fa:fa-gear| B(CD)
    B  -->|fa:fa-rocket| C{project type}
    C -->|docker| D[fe]
    C -->|k8s| E[be]
    D -->|dest| F[host]
    E -->|dest| G[namespace]
```

```mermaid
graph LR
    A[CI] -->|fa:fa-gear| B(CD)
    B  -->|fa:fa-rocket| C{project type}
    C -->|docker| D[fe]
    C -->|k8s| E[be]
    D -->|dest| F[host]
    E -->|dest| G[namespace]
```


```
flowchart LR

A[Hard] -->|Text| B(Round)
B --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]
```

```mermaid
flowchart LR

A[Hard] -->|Text| B(Round)
B --> C{Decision}
C -->|One| D[Result 1]
C -->|Two| E[Result 2]
```


```
gantt
    section Section
    Completed :done,    des1, 2014-01-06,2014-01-08
    Active        :active,  des2, 2014-01-07, 3d
    Parallel 1   :         des3, after des1, 1d
    Parallel 2   :         des4, after des1, 1d
    Parallel 3   :         des5, after des3, 1d
    Parallel 4   :         des6, after des4, 1d
```

```mermaid
gantt
    section Section
    Completed :done,    des1, 2014-01-06,2014-01-08
    Active        :active,  des2, 2014-01-07, 3d
    Parallel 1   :         des3, after des1, 1d
    Parallel 2   :         des4, after des1, 1d
    Parallel 3   :         des5, after des3, 1d
    Parallel 4   :         des6, after des4, 1d
```