<p align="center">
  <a href="https://github.com/benammann/git-secrets-get-secret-action"><img alt="GitHub Actions status" src="https://github.com/benammann/git-secrets-get-secret-action/actions/workflows/test-local.yaml/badge.svg"></a>
</p>

# Git-Secrets Get Secret Action

This action is a wrapper for https://github.com/benammann/git-secrets to use in a github action. It allows you to easily decode any secret value in `.git-secrets.json`

# Usage

<!-- start usage -->
```yaml
- uses: benammann/git-secrets-get-secret-action@v1
  id: get_secret
  with:

    # Required Parameters:
    
    # The name of the secret / config entry to resolve
    name: ''
    
    # The name of the decryptSecret (defined in .git-secrets.json)
    decryptSecretName: ''
    
    # The value of the decryptSecret (defined in ~/.git-secrets.yaml)
    # IMPORTANT: Pass value via secrets! ${{ secrets.MY_SECRET_NAME }}
    decryptSecretValue: ''
    
    # Optional Parameters:
    
    # The filepath to the .git-secret.json file
    # Default: .git-secrets.json
    file: '.git-secrets.json'
    
    # The context to use
    # Default: default
    context: 'default'
    
    # Which resource to resolve
    # Either secret or config
    # Default: secret
    resource: 'secret'
  
    
```

The decoded value is now available at `${{ steps.get_secret.outputs.value }}`

<!-- end usage -->

# Scenarios

- [Decrypt a secret value](#decrypt-a-secret-value)

## Decrypt a secret value

```yaml
- name: Checkout
  uses: actions/checkout@v2
  with:
    fetch-depth: 0
- name: Decrypt Secret Value
  id: test_secret
  uses: benammann/git-secrets-get-secret-action@v1
  with:
    name: testSecret
    decryptSecretName: getsecretactionpublic
    decryptSecretValue: ${{ secrets.GET_SECRET_ACTION_PUBLIC_SECRET }}
- name: Echo the output
  run: echo "${{ steps.test_secret.outputs.value }}"
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)