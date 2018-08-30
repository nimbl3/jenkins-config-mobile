/**
 * Disable all JNLP protocols except for JNLP4 (the suggested one)
 * JNLP4 is the most secure agent protocol because it is using standard TLS.
 * Credit to Sam Gleske - https://github.com/samrocketman/jenkins-bootstrap-shared
 */
import jenkins.model.Jenkins

Jenkins j = Jenkins.instance

if(!j.isQuietingDown()) {
    Set<String> agentProtocolsList = ['JNLP4-connect', 'Ping']
    if(!j.getAgentProtocols().equals(agentProtocolsList)) {
        j.setAgentProtocols(agentProtocolsList)
        println "Agent Protocols Setting: ${agentProtocolsList}"
        j.save()
    }
    else {
        println "Nothing changed. ${j.getAgentProtocols()}"
    }
}
else {
    println 'Shutdown mode enabled and Configure Agent Protocols SKIPPED.'
}