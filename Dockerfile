# ********************************************************
#
# Project: nita-ansible
# Version: 20.10
#
# Copyright (c) Juniper Networks, Inc., 2020. All rights reserved.
#
# Notice and Disclaimer: This code is licensed to you under the Apache 2.0 License (the "License"). You may not use this code except in compliance with the License. This code is not an official Juniper product. You can obtain a copy of the License at https://www.apache.org/licenses/LICENSE-2.0.html
#
# SPDX-License-Identifier: Apache-2.0
#
# Third-Party Code: This code may depend on other components under separate copyright notice and license terms. Your use of the source code for those components is subject to the terms and conditions of the respective license as noted in the Third-Party source code file.
#
# ********************************************************

FROM ansible/ansible-runner:1.4.6

WORKDIR /tmp

# Copy and install Python3 library and modules dependencies
COPY requirements.txt .
RUN pip3 install -r requirements.txt

#Copy and install Ansible module and collections dependencies
COPY requirements.yml .
RUN ansible-galaxy role install -r requirements.yml
RUN ansible-galaxy collection install -r requirements.yml

LABEL net.juniper.image.release="20.7-1" \
      net.juniper.image.branch="20.7" \
      net.juniper.image.issue.date="22/07/2020" \
      net.juniper.image.create.date="22/07/2020" \
      net.juniper.image.mantainer="Juniper Networks, Inc." \
      net.juniper.support.license="UNLICENSED" \
      net.juniper.support.expiration.date="2020-12-31" \
      net.juniper.support.status="UNSUPPORTED" \
      net.juniper.project.id="4538" \
      net.juniper.jtac="Add Information" \
      net.juniper.framework="NITA"

WORKDIR /runner