/// This proposal removes specific validators from the validator set.
script {
    use aptos_framework::aptos_governance;
    use aptos_framework::stake;

    fun main(proposal_id: u64) {
        let framework_signer = &aptos_governance::resolve(proposal_id, @aptos_framework);
        stake::remove_validators(framework_signer, &vector[
            // TODO: Update list of validators to remove.
            @0xda557f6d45952778e0c4c7296dc8f8303d846d5453800efd7b03cfbd5f8def04
        ]);

        // End the epoch so the validator set change takes effect.
        aptos_governance::reconfigure(framework_signer);
    }
}
