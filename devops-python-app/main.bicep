param location string = resourceGroup().location
param appServicePlanName string = 'devops-python-plan'
param webAppName string = 'devops-python-webapp-${uniqueString(resourceGroup().id)}'

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: 'B1' // Free = F1, B1 = Basic (avoid Free if you want pipelines to work consistently)
    tier: 'Basic'
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'my-flask-app-123'
  location: location
  kind: 'app,linux'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: 'PYTHON|3.11'
    }
    httpsOnly: true
  }
}

output webAppUrl string = 'https://${webApp.name}.azurewebsites.net'
