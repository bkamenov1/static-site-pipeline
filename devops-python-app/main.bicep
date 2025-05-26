param location string = resourceGroup().location
param appName string = 'my-flask-app-123'
param acrLoginServer string = 'myacrboyan123.azurecr.io'
param imageName string = 'myflaskapp:v1'

resource plan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: '${appName}-plan'
  location: location
  sku: {
    name: 'B1'
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2022-09-01' = {
  name: appName
  location: location
  kind: 'app,linux,container'
  properties: {
    serverFarmId: plan.id
    siteConfig: {
      linuxFxVersion: 'DOCKER|${acrLoginServer}/${imageName}'
      containerRegistryUseManagedIdentity: false
      appCommandLine: ''
    }
  }
}

output webAppUrl string = webApp.properties.defaultHostName
