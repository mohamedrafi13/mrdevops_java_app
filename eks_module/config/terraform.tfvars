
aws_eks_cluster_config = {

      "demo-cluster" = {

        eks_cluster_name = "demo-cluster1"
        eks_subnet_ids = ["subnet-029354806897e696c","subnet-003db2cd881e158de","subnet-0735446d95585aa29"]
        tags = {
             "Name" =  "demo-cluster"
         }  
      }
}

eks_node_group_config = {

  "node1" = {

        eks_cluster_name         = "demo-cluster"
        node_group_name          = "mynode"
        nodes_iam_role           = "eks-node-group-general1"
        node_subnet_ids          = ["subnet-029354806897e696c","subnet-003db2cd881e158de","subnet-0735446d95585aa29"]

        tags = {
             "Name" =  "node1"
         } 
  }
}