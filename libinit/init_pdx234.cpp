/*
   Copyright (c) 2015, The Linux Foundation. All rights reserved.
   Copyright (C) 2016 The CyanogenMod Project.
   Copyright (C) 2019-2020 The LineageOS Project.
   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.
   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <fstream>
#include <unistd.h>
#include <vector>

#include <android-base/properties.h>
#define _REALLY_INCLUDE_SYS__SYSTEM_PROPERTIES_H_
#include <sys/_system_properties.h>

#include "property_service.h"
#include "vendor_init.h"

using android::base::GetProperty;

void property_override(char const prop[], char const value[], bool add = true) {
    prop_info *pi;

    pi = (prop_info *)__system_property_find(prop);
    if (pi) {
        __system_property_update(pi, value, strlen(value));
    } else if (add) {
        __system_property_add(prop, strlen(prop), value, strlen(value));
    }
}

void full_property_override(const std::string &prop, const char value[], const bool product) {
    const int prop_count = 8;
    const std::vector<std::string> prop_types
        {"", "bootimage.", "odm.", "product.", "system.", "system_ext.", "vendor.", "vendor_dlkm.", "odm_dlkm."};

    for (int i = 0; i < prop_count; i++) {
        std::string prop_name = (product ? "ro.product." : "ro.") + prop_types[i] + prop;
        property_override(prop_name.c_str(), value);
    }
}

static const char *device_prop_key[] =
        { "brand", "device", "model", "cert", "name",
          "marketname", "manufacturer", "mod_device", nullptr };

static const char *device_prop_val[] =
        { "Sony", "XQ-DQ54", "Xperia 1 V", "XQ-DQ54", "XQ-DQ54_EEA",
          "Xperia 1 V", "Sony", "XQ-DQ54", nullptr };

void vendor_load_properties() {
    const char *fingerprint = "Sony/XQ-DQ54_EEA/XQ-DQ54:15/67.2.A.2.60/067002A002006000521143226:user/release-keys";
    const char *description = "XQ-DQ54_EEA-user 15 67.2.A.2.60 067002A002006000521143226 release-keys";

    full_property_override("build.fingerprint", fingerprint, false);
    full_property_override("build.description", description, false);

    for (int i = 0; device_prop_key[i]; ++i) {
        full_property_override(device_prop_key[i], device_prop_val[i], false);
        full_property_override(device_prop_key[i], device_prop_val[i], true);
    }
    full_property_override("build.product", "XQ-DQ54_EEA", false);

    // Set SOMC specific prop
    property_override("ro.semc.product.model", GetProperty("ro.product.device", "").c_str());
    property_override("ro.semc.product.name", GetProperty("ro.product.marketname", "").c_str());
    property_override("ro.semc.version.sw_type", GetProperty("ro.build.type", "").c_str());
}
