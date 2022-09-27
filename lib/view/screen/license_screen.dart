import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LicenseScreen extends StatelessWidget {
  const LicenseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFFDF9),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: IconButton(
              icon: Icon(
                Icons.close,
                size: 28,
              ),
              color: Colors.black,
              onPressed: () => Get.offAllNamed('/setting'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: const Color(0xFFFFFDF9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 10, 0),
                  child: Text(
                    '''
MIT License

Copyright (c) 2019 Jonny Borges

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Copyright 2017 The Chromium Authors. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

   * Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above
copyright notice, this list of conditions and the following disclaimer
in the documentation and/or other materials provided with the
distribution.
   * Neither the name of Google Inc. nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright 2017 The Chromium Authors. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

   * Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
   * Redistributions in binary form must reproduce the above
copyright notice, this list of conditions and the following disclaimer
in the documentation and/or other materials provided with the
distribution.
   * Neither the name of Google Inc. nor the names of its
contributors may be used to endorse or promote products derived from
this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright 2017, the Chromium project authors. All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
        copyright notice, this list of conditions and the following
        disclaimer in the documentation and/or other materials provided
        with the distribution.
    * Neither the name of Google Inc. nor the names of its
        contributors may be used to endorse or promote products derived
        from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

BSD 3-Clause License

Copyright (c) 2017, Ravi Teja Gudapati <tejainece@gmail.com>
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this
  list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the copyright holder nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright 2015, the Dart project authors. 

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
        copyright notice, this list of conditions and the following
        disclaimer in the documentation and/or other materials provided
        with the distribution.
    * Neither the name of Google LLC nor the names of its
        contributors may be used to endorse or promote products derived
        from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The MIT License

Copyright (c) 2013-2021 Brendan Duncan.
All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

Copyright 2013 The Flutter Authors. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
        copyright notice, this list of conditions and the following
        disclaimer in the documentation and/or other materials provided
        with the distribution.
    * Neither the name of Google Inc. nor the names of its
        contributors may be used to endorse or promote products derived
        from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright (c) 2021, Matthew Barbour.
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in the
        documentation and/or other materials provided with the distribution.
    * Neither the name of the <organization> nor the
        names of its contributors may be used to endorse or promote products
        derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright (c) 2014, the Dart project authors.
Copyright (c) 2006, Kirill Simonov.

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
of the Software, and to permit persons to whom the Software is furnished to do
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

The MIT License (MIT)

Copyright (c) 2016 Vladimir Kharlampidi

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Copyright 2013, the Dart project authors. All rights reserved.
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
        copyright notice, this list of conditions and the following
        disclaimer in the documentation and/or other materials provided
        with the distribution.
    * Neither the name of Google Inc. nor the names of its
        contributors may be used to endorse or promote products derived
        from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Copyright 2013 The Flutter Authors. All rights reserved.

Redistribution and use in source and binary forms, with or without modification,
are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
        copyright notice, this list of conditions and the following
        disclaimer in the documentation and/or other materials provided
        with the distribution.
    * Neither the name of Google Inc. nor the names of its
        contributors may be used to endorse or promote products derived
        from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Apache License
                             Version 2.0, January 2004
                          http://www.apache.org/licenses/

   TERMS AND CONDITIONS FOR USE, REPRODUCTION, AND DISTRIBUTION

   1. Definitions.

        "License" shall mean the terms and conditions for use, reproduction,
        and distribution as defined by Sections 1 through 9 of this document.

        "Licensor" shall mean the copyright owner or entity authorized by
        the copyright owner that is granting the License.

        "Legal Entity" shall mean the union of the acting entity and all
        other entities that control, are controlled by, or are under common
        control with that entity. For the purposes of this definition,
        "control" means (i) the power, direct or indirect, to cause the
        direction or management of such entity, whether by contract or
        otherwise, or (ii) ownership of fifty percent (50%) or more of the
        outstanding shares, or (iii) beneficial ownership of such entity.

        "You" (or "Your") shall mean an individual or Legal Entity
        exercising permissions granted by this License.

        "Source" form shall mean the preferred form for making modifications,
        including but not limited to software source code, documentation
        source, and configuration files.

        "Object" form shall mean any form resulting from mechanical
        transformation or translation of a Source form, including but
        not limited to compiled object code, generated documentation,
        and conversions to other media types.

        "Work" shall mean the work of authorship, whether in Source or
        Object form, made available under the License, as indicated by a
        copyright notice that is included in or attached to the work
        (an example is provided in the Appendix below).

        "Derivative Works" shall mean any work, whether in Source or Object
        form, that is based on (or derived from) the Work and for which the
        editorial revisions, annotations, elaborations, or other modifications
        represent, as a whole, an original work of authorship. For the purposes
        of this License, Derivative Works shall not include works that remain
        separable from, or merely link (or bind by name) to the interfaces of,
        the Work and Derivative Works thereof.

        "Contribution" shall mean any work of authorship, including
        the original version of the Work and any modifications or additions
        to that Work or Derivative Works thereof, that is intentionally
        submitted to Licensor for inclusion in the Work by the copyright owner
        or by an individual or Legal Entity authorized to submit on behalf of
        the copyright owner. For the purposes of this definition, "submitted"
        means any form of electronic, verbal, or written communication sent
        to the Licensor or its representatives, including but not limited to
        communication on electronic mailing lists, source code control systems,
        and issue tracking systems that are managed by, or on behalf of, the
        Licensor for the purpose of discussing and improving the Work, but
        excluding communication that is conspicuously marked or otherwise
        designated in writing by the copyright owner as "Not a Contribution."

        "Contributor" shall mean Licensor and any individual or Legal Entity
        on behalf of whom a Contribution has been received by Licensor and
        subsequently incorporated within the Work.

   2. Grant of Copyright License. Subject to the terms and conditions of
        this License, each Contributor hereby grants to You a perpetual,
        worldwide, non-exclusive, no-charge, royalty-free, irrevocable
        copyright license to reproduce, prepare Derivative Works of,
        publicly display, publicly perform, sublicense, and distribute the
        Work and such Derivative Works in Source or Object form.

   3. Grant of Patent License. Subject to the terms and conditions of
        this License, each Contributor hereby grants to You a perpetual,
        worldwide, non-exclusive, no-charge, royalty-free, irrevocable
        (except as stated in this section) patent license to make, have made,
        use, offer to sell, sell, import, and otherwise transfer the Work,
        where such license applies only to those patent claims licensable
        by such Contributor that are necessarily infringed by their
        Contribution(s) alone or by combination of their Contribution(s)
        with the Work to which such Contribution(s) was submitted. If You
        institute patent litigation against any entity (including a
        cross-claim or counterclaim in a lawsuit) alleging that the Work
        or a Contribution incorporated within the Work constitutes direct
        or contributory patent infringement, then any patent licenses
        granted to You under this License for that Work shall terminate
        as of the date such litigation is filed.

   4. Redistribution. You may reproduce and distribute copies of the
        Work or Derivative Works thereof in any medium, with or without
        modifications, and in Source or Object form, provided that You
        meet the following conditions:

        (a) You must give any other recipients of the Work or
            Derivative Works a copy of this License; and

        (b) You must cause any modified files to carry prominent notices
            stating that You changed the files; and

        (c) You must retain, in the Source form of any Derivative Works
            that You distribute, all copyright, patent, trademark, and
            attribution notices from the Source form of the Work,
            excluding those notices that do not pertain to any part of
            the Derivative Works; and

        (d) If the Work includes a "NOTICE" text file as part of its
            distribution, then any Derivative Works that You distribute must
            include a readable copy of the attribution notices contained
            within such NOTICE file, excluding those notices that do not
            pertain to any part of the Derivative Works, in at least one
            of the following places: within a NOTICE text file distributed
            as part of the Derivative Works; within the Source form or
            documentation, if provided along with the Derivative Works; or,
            within a display generated by the Derivative Works, if and
            wherever such third-party notices normally appear. The contents
            of the NOTICE file are for informational purposes only and
            do not modify the License. You may add Your own attribution
            notices within Derivative Works that You distribute, alongside
            or as an addendum to the NOTICE text from the Work, provided
            that such additional attribution notices cannot be construed
            as modifying the License.

        You may add Your own copyright statement to Your modifications and
        may provide additional or different license terms and conditions
        for use, reproduction, or distribution of Your modifications, or
        for any such Derivative Works as a whole, provided Your use,
        reproduction, and distribution of the Work otherwise complies with
        the conditions stated in this License.

   5. Submission of Contributions. Unless You explicitly state otherwise,
        any Contribution intentionally submitted for inclusion in the Work
        by You to the Licensor shall be under the terms and conditions of
        this License, without any additional terms or conditions.
        Notwithstanding the above, nothing herein shall supersede or modify
        the terms of any separate license agreement you may have executed
        with Licensor regarding such Contributions.

   6. Trademarks. This License does not grant permission to use the trade
        names, trademarks, service marks, or product names of the Licensor,
        except as required for reasonable and customary use in describing the
        origin of the Work and reproducing the content of the NOTICE file.

   7. Disclaimer of Warranty. Unless required by applicable law or
        agreed to in writing, Licensor provides the Work (and each
        Contributor provides its Contributions) on an "AS IS" BASIS,
        WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
        implied, including, without limitation, any warranties or conditions
        of TITLE, NON-INFRINGEMENT, MERCHANTABILITY, or FITNESS FOR A
        PARTICULAR PURPOSE. You are solely responsible for determining the
        appropriateness of using or redistributing the Work and assume any
        risks associated with Your exercise of permissions under this License.

   8. Limitation of Liability. In no event and under no legal theory,
        whether in tort (including negligence), contract, or otherwise,
        unless required by applicable law (such as deliberate and grossly
        negligent acts) or agreed to in writing, shall any Contributor be
        liable to You for damages, including any direct, indirect, special,
        incidental, or consequential damages of any character arising as a
        result of this License or out of the use or inability to use the
        Work (including but not limited to damages for loss of goodwill,
        work stoppage, computer failure or malfunction, or any and all
        other commercial damages or losses), even if such Contributor
        has been advised of the possibility of such damages.

   9. Accepting Warranty or Additional Liability. While redistributing
        the Work or Derivative Works thereof, You may choose to offer,
        and charge a fee for, acceptance of support, warranty, indemnity,
        or other liability obligations and/or rights consistent with this
        License. However, in accepting such obligations, You may act only
        on Your own behalf and on Your sole responsibility, not on behalf
        of any other Contributor, and only if You agree to indemnify,
        defend, and hold each Contributor harmless for any liability
        incurred by, or claims asserted against, such Contributor by reason
        of your accepting any such warranty or additional liability.

   END OF TERMS AND CONDITIONS

   APPENDIX: How to apply the Apache License to your work.

        To apply the Apache License to your work, attach the following
        boilerplate notice, with the fields enclosed by brackets "[]"
        replaced with your own identifying information. (Don't include
        the brackets!)  The text should be enclosed in the appropriate
        comment syntax for the file format. We also recommend that a
        file or class name and description of purpose be included on the
        same "printed page" as the copyright notice for easier
        identification within third-party archives.

   Copyright [yyyy] [name of copyright owner]

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

   Copyright ⓒ Cafe24 Corp. <https://fonts.cafe24.com>

카페24(주)이 제공하는 "카페24 써라운드 에어"는 SIL OPEN FONT LICENSE(Version 1.1)에 따라 사용이 허가됩니다.

"카페24 써라운드 에어"의 지적 재산권은 카페24(주)에 있습니다.
"카페24 써라운드 에어"는 개인 및 기업 사용자를 포함한 모든 사용자에게 무료로 제공되며 자유롭게 수정하고 재배포할 수 있습니다.
단, 글꼴 자체를 유료로 판매하는 것은 금지하며 본 저작권 안내와 라이선스 전문을 포함해서 다른 소프트웨어와 번들하거나 재배포 또는 판매가 가능합니다.
라이선스 전문을 포함하기 어려울 경우, 출처 표기를 권장합니다.
예) 이 페이지에는 카페24(주)이 제공한 "카페24 써라운드 에어"가 적용되어 있습니다.
"카페24 써라운드 에어"가 사용된 인쇄물, 광고물(온라인 포함)의 이미지는 카페24(주)의 프로모션을 위해 활용될 수 있습니다.
이를 원치 않는 사용자는 언제든지 당사에 요청하실 수 있습니다.

정확한 사용 조건은 아래의 SIL OPEN FONT LICENSE 전문을 참고하시기 바랍니다.

=========================================================
SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
=========================================================

PREAMBLE
The goals of the Open Font License (OFL) are to stimulate worldwide development of collaborative font projects, to support the font creation efforts of academic and linguistic communities, and to provide a free and open framework in which fonts may be shared and improved in partnership with others.
The OFL allows the licensed fonts to be used, studied, modified and redistributed freely as long as they are not sold by themselves. The fonts, including any derivative works, can be bundled, embedded, redistributed and/or sold with any software provided that any reserved names are not used by derivative works. The fonts and derivatives, however, cannot be released under any other type of license. The requirement for fonts to remain under this license does not apply to any document created using the fonts or their derivatives.

PERMISSION & CONDITIONS
Permission is hereby granted, free of charge, to any person obtaining a copy of the Font Software, to use, study, copy, merge, embed, modify, redistribute, and sell modified and unmodified copies of the Font Software, subject to the following conditions:
1) Neither the Font Software nor any of its individual components, in Original or Modified Versions, may be sold by itself.
2) Original or Modified Versions of the Font Software may be bundled, redistributed and/or sold with any software, provided that each copy contains the above copyright notice and this license. These can be included either as stand-alone text files, human-readable headers or in the appropriate machine-readable metadata fields within text or binary files as long as those fields can be easily viewed by the user.
3) No Modified Version of the Font Software may use the Reserved Font Name(s) unless explicit written permission is granted by the corresponding Copyright Holder. This restriction only applies to the primary font name as presented to the users.
4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font Software shall not be used to promote, endorse or advertise any Modified Version, except to acknowledge the contribution(s) of the Copyright Holder(s) and the Author(s) or with their explicit written permission.
5) The Font Software, modified or unmodified, in part or in whole, must be distributed entirely under this license, and must not be distributed under any other license. The requirement for fonts to remain under this license does not apply to any document created using the Font Software.

TERMINATION
This license becomes null and void if any of the above conditions are not met.

DISCLAIMER
THE FONT SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM OTHER DEALINGS IN THE FONT SOFTWARE.

======================================================================
* 다음의 SIL OPEN FONT LICENSE 번역은 이용자들의 이해를 돕기 위한 것으로 법적 효력은 영문에 한합니다.

PREAMBLE (전문)
‘폰트 소프트웨어’는 본 라이선스에 입거해 저작권자가 배포하고 명확하게 같은 표시가 된 파일들의 집합을 뜻하며, 여기에는 소스 파일, 빌드 스크립트와 문서가 이에 포함됩니다.
‘저작권이 있는 폰트명’은 저작권 정책에 따라서 지정된 이름을 말합니다.
‘원본’은 저작권자가 배포한 폰트 소프트웨어 구성요소를 의미합니다.
‘수정본’은 포맷의 변경이나 폰트 소프트웨어를 새로운 환경에 포팅시켜, 원본의 일부 혹은 전체에 추가, 삭제 대체해 만든 파생 저작물을 의미합니다.
‘저자’는 폰트 소프트웨어에 기여한 디자이너, 엔지니어, 프로그래머, 기술 전문가 등을 의미합니다.

PERMISSION & CONDITIONS (허가 및 조건)
본 폰트 소프트웨어를 사용하도록 허가 받은 개인/기업/단체 누구라도 다음 명시된 조건에 따라 폰트 소프트웨어의 수정 혹은 수정되지 않은 복사본을 무료로 사용, 연구, 복사, 통합, 삽입, 수정, 재배포할 수 있도록 허가합니다.
1) 원본이나 수정본의 폰트 소프트웨어 혹은 개별 구성요소인 폰트 자체가 판매되어서는 안됩니다.
2) 본 폰트 소프트웨어의 원본 혹은 수정본은 상기 저작권 안내와 본 라이선스에 대한 내용을 포함하는 경우에는 다른 소프트웨어와 함께 묶이거나 재배포 혹은 판매가 가능합니다. 이는 독립 텍스트 파일과 가독성이 있는 헤더 혹은 유저가 용이하게 열람 가능한 이상 텍스트파일 혹은 이진파일 내 기계가 읽을 수 있는 메타데이터 형태를 모두 의미 합니다.
3) 본 폰트 소프트웨어의 어떠한 수정본도 동일한 저작권자가 명시적 허가서를 부여하지 않는 한 저작권이 있는 폰트명을 사용해서는 안 됩니다. 본 제한 사항은 유저들에게 제공된 기존 폰트명을 뜻합니다.
4) 본 폰트 소프트웨어의 저작권자 혹은 저자의 이름은 그들의 명시적 서면 허가가 있거나 또는 그들의 공헌을 인정하기 위한 경우를 제외하고는 수정본에 대한 사용을 유도,추천 혹은 광고하기 위한 목적으로 사용할 수 없습니다.
5) 본 폰트 소프트웨어는 전체나 부분, 혹은 수정 여부에 상관없이 본 라이선스 하에 배포가 되어야 하며 기타 다른 라이선스 하에서는 배포를 할 수 없습니다. 폰트에 대한 요구조건은 이 라이선스 하에서만 유효하며 이 라이선스 하에 있기 위한 폰트에 대한 요구사항은 본 폰트 소프트웨어를 사용해 제작한 어떠한 문서에도 적용되지 않습니다.

TERMINATION (계약의 종료)
본 라이선스는 상기 조건 중 일부라도 부합되지 않으면 무효가 될 수 있습니다.

DISCLAIMER (면책조항)
본 폰트 소프트웨어는 저작권, 특허권, 상표권 및 기타 권리의 비침해성과 특정 목적에의 적합성 포함한 명시적, 묵시적인 어떠한 종류의 보증 없이 “있는 그대로” 제공됩니다. 어떠한 경우에도 저작권자는 본 폰트 소프트웨어의 사용 또는 이의 사용불가, 그밖에 폰트 소프트웨어의 취급과 관련하여 발생하는 모든 계약, 불법행위 혹은 다른 일로 하여금 발생하는 일반적, 특수적, 간접적, 부차적 혹은 필연적 손해를 포함하는 소송, 손해, 혹은 기타 책임에 대한 의무를 가지지 않습니다.


——

출처 링크 : https://gongu.copyright.or.kr/gongu/wrt/wrt/view.do?wrtSn=13302259&menuNo=200023

<img id="wrtImg" src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=13302259&filePath=L2Rpc2sxL25ld2RhdGEvMjAyMi8wMS9DTFMxMDAwOS84MzdmZWFmZS0zZmE2LTQxMjctOWU4ZC1kNzY3YWExZGE2NTc=&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10009">
<p style="font-size: 0.9rem;font-style: italic;">
<span>
title : <a href="https://gongu.copyright.or.kr/gongu/wrt/wrt/view.do?wrtSn=13302259&menuNo=200023"> 코트라 희망체</a>
authr : <a href="https://gongu.copyright.or.kr/gongu/wrt/wrt/view.do?wrtSn=13302259&menuNo=200023"> KOTRA</a>by
site : <a href="https://gongu.copyright.or.kr/gongu/main/main.do">공유마당 저작권 위원회</a></span> <br>
is licensed under
<img src="https://gongu.copyright.or.kr/static/gongu/img/common/img_license01.png" alt="KOGL 출처표시, 상업적, 비상업적 이용가능, 변형 등 2차적 저작물 작성 가능" class="img_cc">

</p>


——

에스코어 글꼴 라이선스
닫기
* 		에스코어 홈페이지를 통해 배포되는 에스코어 폰트의 지적 재산권은 에스코어 주식회사에 있습니다.
* 		에스코어 폰트는 개인 및 기업 사용자를 포함한 모든 사용자에게 상업적 사용이 가능하도록 무료로 제공되며 자유롭게 재배포 하실 수 있습니다.
* 		어떠한 이유로도 폰트 파일을 수정, 판매할 수 없으며 배포되는 파일 형태 그대로 사용해야 합니다. (단, 기울기 적용, 형태 변형 등의 디자인 수정은 자유롭게 가능합니다.)
* 		에스코어 폰트는 본 저작권 안내를 포함해서 다른 소프트웨어와 번들하거나 재배포 또는 판매가 가능합니다. 에스코어 폰트 저작권 안내를 포함하기 어려울 경우, 에스코어 폰트의 출처 표기를 권장합니다. 예) 이 페이지에는 에스코어가 제공한 에스코어 드림 폰트가 적용되어 있습니다. *출처 표기는 반드시 하지 않으셔도 됩니다.
* 		에스코어 폰트를 사용한 인쇄물, 광고물(온라인 포함)의 이미지는 에스코어의 프로모션을 위해 활용될 수 있습니다. 이를 원치 않을 경우 언제든지 에스코어에 요청하실 수 있습니다.

                ''',
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      fontFamily: 'gMarket',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
