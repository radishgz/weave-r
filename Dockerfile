FROM golang:1.7.5
ENV GO15VENDOREXPERIMENT 1
RUN apt-get update && apt-get install -y libpcap-dev python-requests time file
RUN go get github.com/golang/lint/golint github.com/fzipp/gocyclo github.com/client9/misspell/cmd/misspell
RUN go get "github.com/Sirupsen/logrus"                
RUN go get "github.com/andybalholm/go-bit"             
RUN go get "github.com/aws/aws-sdk-go/aws"             
RUN go get "github.com/aws/aws-sdk-go/aws/ec2metadata" 
RUN go get "github.com/aws/aws-sdk-go/aws/session"     
RUN go get "github.com/aws/aws-sdk-go/service/ec2"     
RUN go get "github.com/boltdb/bolt"                    
RUN go get "github.com/coreos/go-iptables/iptables"    
RUN go get "github.com/docker/docker/pkg/mflag"        
RUN go get "github.com/fsouza/go-dockerclient"         
RUN go get "github.com/google/gopacket"                
RUN go get "github.com/google/gopacket/layers"         
RUN go get "github.com/google/gopacket/pcap"           
RUN go get "github.com/gorilla/mux"                    
RUN go get "github.com/j-keck/arping"                  
RUN go get "github.com/miekg/dns"                      
RUN go get "github.com/pkg/profile"                    
RUN go get "github.com/vishvananda/netlink"            
RUN go get "github.com/vishvananda/netns"              
RUN go get "github.com/weaveworks/go-checkpoint"       
RUN go get "github.com/weaveworks/go-odp/odp"          
RUN go get "github.com/weaveworks/mesh"                
RUN go get "golang.org/x/crypto/nacl/secretbox"        
RUN go clean -i net && go install -tags netgo std
RUN go install -race -tags netgo std
