// Run these script in order to create service account user

kubectl create sa cicd

kubectl get sa,secret


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Pod
metadata:
  name: cicd
spec:
  serviceAccount: cicd
  containers:
  - image: nginx
    name: cicd
EOF



kubectl exec cicd cat /run/secrets/kubernetes.io/serviceaccount/token && echo


kubectl create token cicd

kubectl create token cicd --duration=999999h


cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
type: kubernetes.io/service-account-token
metadata:
  name: cicd
  annotations:
    kubernetes.io/service-account.name: "cicd"
EOF



cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: ClusterRoleBind
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: cicd
  namespace: default
EOF


kubectl get sa,secret

kubectl describe secret cicd

kubectl describe sa cicd

kubectl get sa cicd -oyaml

kubectl get sa,secret