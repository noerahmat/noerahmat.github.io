FROM ubuntu                                                                                                            
ARG GIT_USER=abc                                                                                                     
ARG GIT_PASS=xxxx                                                                                                     
ARG DOCKERHUB_USER=abc                                                                                                     
ARG DOCKERHUB_PASS=abc                                                                                                     
ENV ACCESS=$GIT_PASS                                                                                                       
ENV RUN_TIME=123                                                                                                       
RUN touch /env.txt                                                                                                     
RUN printenv > /env.txt 