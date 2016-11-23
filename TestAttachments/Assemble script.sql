


select	'http://beehiveuser.blob.core.windows.net/attachments/1066/files/13/' +filepath
from	Attachments a
join	FeatureAttachments fa on fa.attachmentid = a.id
join	features f on f.id = fa.featureid
join	featureclasses fc on fc.id = f.featureclassid
where	fc.primaryagencyid = 13
and		f.isdeleted = 0
and		fa.isdeleted = 0
and		a.isdeleted = 0
and		a.filepath is not null
and		a.createdate > '20160930'

union all

select	'http://beehiveuser.blob.core.windows.net/attachments/1066/files/13/' +filepath
from	Attachments a
join	EventAttachments fa on fa.attachmentid = a.id
join	events f on f.id = fa.eventid
join	eventtypes et on et.id = f.eventtypeid
join	featureclasses fc on fc.id = et.featureclassid
where	fc.primaryagencyid = 13
and		f.isdeleted = 0
and		fa.isdeleted = 0
and		a.isdeleted = 0
and		a.filepath is not null
and		a.createdate > '20160930'


select	f.name,f.EventTypeId,a.FilePath,a.Comment,a.CreateDate,a.CreatedBy,a.InitialFilePath
from	Attachments a
join	EventAttachments fa on fa.attachmentid = a.id
join	events f on f.id = fa.eventid
join	eventtypes et on et.id = f.eventtypeid
join	featureclasses fc on fc.id = et.featureclassid
where	filepath in (
'0a9a06eb-d836-4b30-b773-abcf87dedc10.jpg'
,'cee157d3-30f3-4b7c-a7f0-e6d486f0dad2.jpg'
,'4f088ef5-4ea5-4392-abf3-e8b17cb30ac4.jpg'
,'64b26f60-6cf5-4281-9c3d-7d6a88c40ef7.jpg'
,'eebb7338-3576-4a39-8752-23d9a8400826.jpg'
,'22c5d000-c5ff-4f50-ac5e-8ed9899c595b.jpg'
,'27bb2c47-d69c-4ba8-bb34-047eb05d3e35.jpg'
,'9cb510dd-9979-4b28-80f5-b7b2b2489b0e.jpg'
,'560fca35-9e3f-4c8e-a3f1-0c0633fbbe12.jpg'
,'0125c7b4-17fe-4533-ba25-088bd632831e.jpg'
,'28dac114-c3d8-4328-b49f-b6b56780ab0e.jpg'
,'d5658d58-5d3c-4fc4-8d19-34f5e8be2c42.jpg'
,'a4b5dbb6-e1c7-4308-9da4-e7732fac8dde.jpg'
,'a597cc5c-6311-4f9d-b6e2-28893d670aa0.jpg'
,'ed1087ab-9034-4d40-ad01-4ae62de93aec.jpg'
,'b8e13494-3af6-452e-90df-0fa40dfd95f2.jpg'
,'800d551c-3c73-4b96-b4e0-b27e84e41222.jpg'
,'0532c188-5ef9-4b06-9896-0800182ed951.jpg'
,'8576c7bf-3f3a-4623-bfcf-d9e8b123a3a9.jpg'
,'cbb15747-dcf6-41c6-826c-b0e2b1a750ca.jpg'
,'01e5dee5-0201-415e-b081-37a8ddde5d67.jpg'
,'5c2ded8d-99e9-4eea-b358-2d64370b9b97.jpg'
,'f2414e6b-2e62-4e2c-95ea-291738167fdb.jpg'
,'43940c55-faca-4054-abfb-259407b951ec.jpg'
,'7f42c7a2-8bf6-4839-bfd0-7e985e6e0856.jpg'
,'61ac754e-8f4d-41d3-9deb-276f9ac27b03.jpg'
,'b4fd28da-b355-4a7b-9c7b-f71aac067954.jpg'
,'6538309c-75be-4b29-85de-46f479775cb9.jpg'
,'310362d6-e124-4166-85f5-40952403dd39.jpg'
,'0fcff749-65dd-4c79-8588-8055710dbd50.jpg'
,'18dabeda-ad85-4f87-a57d-dab7ed2601cb.jpg'
,'1764b417-1c80-408a-94fb-0342cefe6277.jpg'
,'4f2d93cd-845a-4eed-b9ec-603eb812aa05.jpg'
,'e5e36d4e-b480-4ca5-9b23-ba778c2d8334.jpg'
,'aea285f3-18df-40d0-bb9e-07db11c1d181.jpg'
,'b52325fb-bd41-4022-a01b-ee3a7d203e78.jpg'
,'9e3b46ec-8353-4574-b8fa-3ec19a8e1ab3.jpg'
,'56a72226-9d25-4900-b51c-5374b006a2ff.jpg'
,'7eed304a-109a-4f97-a1a7-3eb107fb1565.jpg'
,'5e44c2c5-3e65-4aa3-a975-b2f29b727e96.jpg'
,'2ea9c5c4-ad7a-4541-b768-94e73addc45d.jpg'
,'2b2b788a-42de-401c-b0ed-ca300806c5ea.jpg'
,'934f340a-810a-4faf-b1df-103f91957965.jpg'
,'f8b8bc55-3299-435c-a6f5-adc4918fec40.jpg'
,'019e5791-5c88-43e9-84a6-db9a2d1a33f7.jpg'
,'c578029f-c49d-447a-a690-8d7151cafc91.jpg'
,'e5cb5d2f-9473-4657-a85c-9309ee213413.jpg'
,'42526d17-5b0b-4c12-a544-b3b7701806ef.jpg'
,'f39c70db-3c99-431c-b7fa-07d82593e67e.jpg'
,'6d22ad8d-b5b3-41ef-b0f7-6e861bb61810.jpg'
,'e5af0d9c-d381-4e0d-9f6e-351eca016971.jpg'
,'a3217d74-454a-4639-b1fb-ea882db2ca80.jpg'
,'972555bd-1ec7-4b7c-bb29-04071173f7d8.jpg'
,'9d4eeebe-a66f-4137-8d8f-e33b8e9ad4ba.jpg'
,'8f0ab87c-2429-47ac-9c8c-b29c7db8fc30.jpg'
,'9b2cb0f2-5eb5-478d-a5a1-28739e47341d.jpg'
,'4b6bd69f-92ec-4ac7-ae95-a718af2788be.jpg'
,'7764aaf6-98b6-4919-85cb-ce4f8fe1faf1.jpg'
,'97103cbe-1adf-4c08-a677-29546995dee0.jpg'
,'f4da7d41-06e3-46aa-a7be-50a55ccad573.jpg'
,'c32ffefe-5db4-44c7-ae36-5b049dd18dab.jpg'
,'bcc594f8-c511-4f27-9162-3027a0da29dd.jpg'
,'cf6260ab-4130-467c-a0af-5d9d2b8fe9b0.jpg'
,'3faecbcd-07fb-490b-a08d-301f991a5c54.jpg'
,'8446a018-6860-4fc3-85e8-0539125d8ad8.jpg'
,'db8ba2c5-42a2-47af-8b78-f971677d2c79.jpg'
,'98e60c96-cd67-4e9c-b744-2dddf267c9f4.jpg'
,'9e96e56f-2266-429d-b556-7a1ff02ba906.jpg'
,'3a018fed-1fef-4423-86b9-4b215ee6599f.jpg'
,'81b19213-5b16-46bc-97ba-4783c6c74ae1.jpg'
,'054ff49e-a457-452f-949f-9971cf509a5e.jpg'
,'54fcfe0a-acea-4f57-919c-0babe741d048.jpg'
,'d50b56ae-c4c2-4d20-bc55-baf8b4b5a92f.jpg'
,'636048a2-41e8-4ee3-9b95-dea090955817.jpg'
,'a22d19cd-92b8-423b-8d23-fd33e633b445.jpg'
,'83bed604-bbca-4829-a23f-861f3f7272cc.jpg'
,'fb0f0674-7893-4044-a719-637337e9be01.jpg'
,'3f2bdb21-17cc-409e-b434-adfbe1dc01e8.jpg'
,'7f01f6b3-bb9b-4b09-a441-80d27e18281f.jpg'
,'e60a4fb7-4ca9-4a43-8335-9e646c97801e.jpg'
,'cb4fea3c-1b6e-40c9-8154-284de73a9518.jpg'
,'571176fe-a070-418f-ac0a-e4a6486340e5.jpg'
,'bf870167-2d5a-4bdb-a805-a72f1f59d628.jpg'
,'ea8ce086-73ac-407b-84e1-49b75afaf86a.jpg'
,'ea0edbe1-8997-44f7-ba95-066d5cab54ef.jpg'
,'a83ed3e2-66ac-430b-91b7-dca40437c26d.jpg'
,'ce2f5960-daed-4d14-9776-cc7b2145bdde.jpg'
,'778af50d-d6c6-44f1-ac04-0cd3a5db0ad1.jpg'
,'9091efc7-aed7-43e3-8c6a-621e9dd56e90.jpg'
,'41281a66-6404-4dd8-8e0e-06fc6f360370.jpg'
,'3fe5b2a2-e902-4f5b-bcd3-652c5488d510.jpg'
,'001d3bfa-ea15-4155-b302-9c2836af61a6.jpg'
,'5b5eacb0-5543-4579-ac0e-03c8ca0ff334.jpg'
,'02db79ff-401a-4951-940d-33366ac19fe1.jpg'
,'8dc059d1-cae2-478b-a12c-8e2adbca70c6.jpg'
,'a2de393d-7ea2-407a-a2aa-cc24d833ae57.jpg'
,'482c245f-0dc8-4e9e-9e01-f35977c06f48.jpg'
,'3749998c-f566-4148-a94a-672ac056d18d.jpg'
,'bf86ff7c-6b68-46d0-94b6-7c92641261f5.jpg'
,'46635049-5855-48c6-895b-c01d869c91e7.jpg'
,'e3d325da-7430-4917-bda5-3a215e6d569f.jpg'
,'55a601eb-ebb4-48d1-829a-3165e0deea11.jpg'
,'2409aa09-b0fe-447b-8e84-05f0c19fa4b5.jpg'
,'58941e09-3c1d-4891-99ac-7e96ec8f6520.jpg'
,'89d3250d-d5d4-4057-8900-b13bf6c45d89.jpg'
,'bcb177bf-4b44-4ebc-bb04-a81ae98e78c0.jpg'
,'c452e753-3daa-4c07-ab90-f59f5c4bc317.jpg'
,'b1923b0d-45fd-4068-88ae-5222208a8269.jpg'
,'a29ab9f1-01fa-4196-b1b4-2fbbd3a26eb4.jpg'
,'c84e1c77-506e-40ba-a00a-f392bb83a0d6.jpg'
,'169e1768-180b-431e-a54c-735071391084.jpg'
,'e3f8fcd1-c0e2-4522-98cb-24e46731d865.jpg'
,'d30d5199-d769-4c0c-bdda-061d9ef960e3.jpg'
,'a1548356-aa1c-4714-a453-3d0bf451c19a.jpg'
,'c522129a-4d11-4f5b-afe3-ca733594b096.jpg'
,'e1d28ef8-6f73-4f7d-b065-46224d91849d.jpg'
,'0dcc4b7a-5842-474a-b144-fec86b586c77.jpg'
,'056939e0-0e66-41bd-b819-c592aa0595de.jpg'
,'b6af4e8a-e653-4f23-8ec6-735b1b9fc165.jpg'
,'5e1c76fc-0fa4-4fe6-a290-a540e13fb297.jpg'
,'43915cf0-4baa-4144-9a61-26af39c5a4cb.jpg'
,'e85df601-9a6b-4908-a894-9f44bb0ab4ca.jpg'
,'2f31b26f-3b0b-43c0-9f34-02754e1c4fd3.jpg'
,'0268c44d-d863-4715-a0db-f39b5847f5ae.jpg'
,'24faf0cd-aa78-404e-84f4-2e4ac841c1d3.jpg'
,'6703cd1f-f3ad-4a3f-9418-c5b15f27594d.jpg'
,'a2c557b8-9483-4b52-85a2-7024ff00af49.jpg'
,'dd3e6703-cbd0-4f20-9df3-8d9d14816d39.jpg'
,'0a9ffc7c-ea39-4a6f-8a13-f5dc7c645c19.jpg'
,'97860af2-4e9f-46d8-99fe-16d30512c9d4.jpg'
,'c912565a-c821-40e1-a5cb-cccd18b1e7c3.jpg'
,'20397a1c-05ac-478a-9785-2a437cbf5141.jpg'
,'64ec9fc7-dd06-4d01-8002-84fbc5e6aa42.jpg'
,'77a83a9a-98bc-4303-9338-f7e50d45b7a0.jpg'
,'5cfafc91-7903-4a52-9e00-6b92b6cd9407.jpg'
,'63b7e395-8ebf-43f3-8150-66d511754988.jpg'
,'bc2d02a7-7988-4045-b53c-be35558e3e09.jpg'
,'05273972-5f54-4833-9a95-6b0520cfb79f.jpg'
,'b544ad0b-c085-4c1d-9e30-5c3954beaa85.jpg'
,'8505c3ef-b9d8-4c68-8f87-346685a3d945.jpg'
,'c42ef123-5192-4718-9ad6-9bf0382ae479.jpg'
,'8ae64420-37b6-4949-bce1-2530fa113670.jpg'
,'2d2b584b-d9bf-4b81-a5df-8dc9191fecb2.jpg'
,'9ca9589b-4388-4964-bb0f-f2af3d81881c.jpg'
,'94aa941f-c02d-4391-96cd-575fbdf64e46.jpg'
,'2f9590fd-04a4-4e8d-894e-246ec38e5546.jpg'
,'f2f73714-8af1-45bf-a29a-3907de715859.jpg'
,'b0f6207e-c911-4068-84e7-d9a1c34a1471.jpg'
,'c5b57b2f-0ac5-4cb1-9070-44e4ae208024.jpg'
,'62e36b0a-244b-48f4-be5c-a2c64411b52e.jpg'
,'8ac7bc3a-720f-48f3-b98b-9e85e4b32201.jpg'
,'e65be32e-649b-4647-bceb-909c000ec62d.jpg'
,'53229a06-54f4-40af-88b4-1abad9ead1cb.jpg'
,'5051c0c8-6a2d-45bf-8717-c866444bdd10.jpg'
,'c8fa2139-7f2c-4754-a4f6-c473ce133f7a.jpg'
,'7242b94d-72ff-4f76-b616-81ced460c4a6.jpg'
,'dcccd448-610f-4ee7-b12a-b669b9a93302.jpg'
,'3fefe304-ebc8-4552-bddc-f56861fc5ba4.jpg'
,'9745640e-b7da-4b5e-afa6-862a404ec506.jpg'
,'c9b46c40-7e73-45da-8c9e-eb0d0e9f5767.jpg'
,'89c9c05b-5a0f-40ee-b798-21d05f4b1819.jpg'
,'3b99446c-6b22-4574-9a40-8f4baf7a2acb.jpg'
,'056dc937-e348-4812-b7d7-078efc2e4e68.jpg'
,'e0cf6ea0-2ebf-436c-bb25-dbbbcbe6009f.jpg'
,'c33e39e9-a8e7-41c6-aa4a-d68f78f246f3.jpg'
,'8ceee858-d630-4106-9910-031b309978b4.jpg'
,'b70dd957-fca5-4250-b7af-220524dff250.jpg'
,'5fdf2285-50b8-4d8c-96b5-ed7f391dad04.jpg'
,'e3381cd0-30e5-4599-89e7-b70befb30232.jpg'
,'f66c6c77-e44b-48b1-828e-0e5751eaf0f5.jpg'
,'e1cc21d6-7d47-48e5-807c-9cbfb015af06.jpg'
,'8bfae4e0-e15b-42ae-bbaf-1a9070e0b741.jpg'
,'36da02ce-d5de-4386-870b-b4f64c3e9509.jpg'
,'81271f8a-457d-405e-847e-d4d2d8fad3c5.jpg'
,'6f30441c-4010-46bb-a163-62c64c4e39c8.jpg'
,'11557e28-d2d0-4d2e-8c24-8042576edfab.jpg'
,'b7f139a1-c57f-413f-9cb3-99a3194860e3.jpg'
,'3914b247-7184-4bd8-b067-26efc5970000.jpg'
,'5f7bdb97-7cc4-4559-bc01-8f8ca75fb7fc.jpg'
,'d1927c6d-2896-480e-8b26-6d054b1a9d9a.jpg'
,'6945b650-3ded-4a94-9792-7a37c144a883.jpg'
,'8bcff792-a1a0-4cd3-a1c9-04f76c4accdf.jpg'
,'5eb57f0a-cbdd-4f5a-b7cf-af03941ce6c9.jpg'
,'8fbb45a5-ea1c-4d68-aae2-5c797ba72b15.jpg'
,'2ff3beb4-8190-49d8-81b9-59dd9348cb83.jpg'
,'ae526599-b660-4e14-93e1-46d446200d35.jpg'
,'a0f899f2-60bd-4bf6-b121-c5e59ae13399.jpg'
,'4542fc96-30c1-4f62-bc69-60227d42aeba.jpg'
,'95f13680-f61f-4ddc-8f4c-6f65f94e317f.jpg'
,'428131c0-2e46-4464-918f-19fe7740402c.jpg'
,'018c089d-0689-43a9-84c0-bb9cc2ec2e4b.jpg'
,'3d83b600-138c-433e-a288-417fa1546abd.jpg'
,'96108562-c6fb-4de6-8193-4772fbdc88c6.jpg'
,'021f7989-de2b-410a-990d-31a760c062f0.jpg'
,'b2441dfa-4392-4a4c-963f-9a754987a63c.jpg'
,'e25ca79f-75ec-4e3f-85e7-32daea37999f.jpg'
,'1659a9ce-d16f-49b8-9f1e-caef00ee6a95.jpg'
,'53b4ed3d-3147-43d1-b05a-997e9b7a0520.jpg'
,'206d0c18-f013-4d7c-9761-b3229c3e5dfc.jpg'
,'64f14520-339e-43c3-a456-063c1d794993.jpg'
,'51ecfdf9-3f31-467c-b43a-fcd957c0f2ed.jpg'
,'c5e2dd63-4507-4567-bd50-27530ff3d377.jpg'
,'c7d9e9dc-ddcb-43ec-b8ff-e9d440daa125.jpg'
,'3dd2b977-a3cb-4d46-9857-f05676b2c223.jpg'
,'b3e11d54-30ba-4664-b645-d365c49de32f.jpg'
,'6c91a75d-d913-4298-8457-71ac835ccec8.jpg'
,'845a090e-ff1d-4058-ac79-b60932647a00.jpg'
,'184bb04c-82e4-409e-ba95-352d78cf9246.jpg'
,'a878962f-9fc3-44cb-b286-4beaad787d6f.jpg'
,'0f201347-f463-4381-a3db-de3cbbfa799b.jpg'
,'56c91c26-4044-460c-9c98-c7c5d2118c90.jpg'
,'eed82891-098e-4f8b-8e18-9b87aafe4419.jpg'
,'1bf8d437-f357-4796-89a1-a71028248990.jpg'
,'3ec7067a-0b88-458e-b90e-0645b3f92852.jpg'
,'5ada2551-7738-439a-9420-3b4899cdf7f0.jpg'
,'b1560a8b-1b41-44b8-820e-af5bed30ac8a.jpg'
,'f4ead912-8d2a-4843-af1c-4e837ab09b8d.jpg'
,'fa6e16b7-01b2-425b-835d-30e51ff52b86.jpg'
,'5004695a-02f6-476e-baa7-da4d498e474e.jpg'
,'dbb72113-5264-4ec6-ac87-d885d78fd46d.jpg'
,'569e3800-9c7d-410f-8b00-51ae1326f495.jpg'
,'bbdd4827-f5fb-41de-87c2-9e5d22316d36.jpg'
,'8b89b95d-7ad6-472e-b96b-8bb9f954baf8.jpg'
,'e4220454-0dae-471e-8baf-e86d09cc2d22.jpg'
,'5f11133b-5d0f-4e3d-9b7d-335896a1f258.jpg'
,'644f8e7b-3817-4dcb-9121-7d4507665ce8.jpg'
,'d7fdf031-3ae0-4821-b1ed-386cc2994517.jpg'
,'cde79807-9cdd-48bc-a81e-bcac810b37af.jpg'
,'c6c5453b-bf80-4f0a-bb12-51f7949dddab.jpg'
,'953438bd-6407-497f-aca3-b563313ee811.jpg'
,'0008696c-3c53-43d3-9c80-89608144ae46.jpg'
,'56b2c6fc-b912-486c-8a74-17601d307a4e.jpg'
,'ddf20870-fbe9-4921-925a-baa514cdad52.jpg'
,'7f0f4c6d-b743-4736-bf6c-3ed5d738c290.jpg'
,'697e67cd-5de2-411b-9350-04349aeec7cd.jpg'
,'7895ab24-84ca-4158-88b6-bbe31de2f14a.jpg'
,'7b5c5940-23b3-4a98-accd-35d863f82dfa.jpg'
,'dd53bcc0-9a9e-4823-be69-95ca5eecc77a.jpg'
,'d2bcbf0d-edd9-4257-819b-cba6b901e51b.jpg'
,'7de980d9-c03f-4dcd-a83c-900c99580420.jpg'
,'98924467-0748-4044-a7e2-29ed74724fe3.jpg'
,'87d41913-54a3-4024-95a8-79f6982741fb.jpg'
,'c4281ab7-7df8-4a19-ad80-6b1983e2141a.jpg'
,'80f1d7df-1bd8-4ef1-9cd6-97f5e9f000f3.jpg'
,'8f4ff2fb-2981-467e-9000-4050c6abd320.jpg'
,'a13361ce-feff-467c-bf3f-c972f2f376db.jpg'
,'bd93216c-4a28-44b3-b6e3-00f77924122f.jpg'
,'fd3b7ca3-77af-4e77-8efc-6d43159d5f02.jpg'
,'d619cb58-a23e-446f-93b6-afed61b7f67d.jpg'
,'0090718b-bd61-4923-a30f-70b0b80be9f8.jpg'
,'2a2e0306-3e3d-4dde-9a80-42b73ee88501.jpg'
,'8c102832-c847-444b-bb45-8326e3adefd0.jpg'
,'57d6adf0-c065-4022-8072-af436e446122.jpg'
,'eacd7043-bb4b-41a9-b9ed-99987d5c5f16.jpg'
,'8496e2d0-1360-491c-99be-2b4349ae47ed.jpg'
,'dafb3d4c-469b-4a38-8ff2-925e86b88602.jpg'
,'a9932349-d9a8-4361-a07e-029d7eab6c07.jpg'
,'44cc3894-3c5e-4f0f-920c-ebdccb98a6f1.jpg'
,'8c9bca26-0457-4f83-bd2d-73deb6d5b504.jpg'
,'27d6038e-1c97-43cd-8571-123e08c2f29c.jpg'
,'b2c7b2dc-4a86-42cc-a193-d0764c60ca03.jpg'
,'f671c5f6-ad30-43ee-9013-02b6721aea01.jpg'
,'4095dd83-a7c1-4bdc-9f65-9fcab0712aa5.jpg'
,'a08791d9-307e-46c4-acb9-32f076f9aa47.jpg'
,'b19c1205-dafa-4ab4-a2ba-1433930f0008.jpg'
,'cab0238d-6b11-41e5-82d7-047d6e9d3039.jpg'
,'05367dc1-f0fd-44bd-8e37-8adf09d8b128.jpg'
,'43df0654-a3d3-4777-9567-cd6794696b95.jpg'
,'9b80fed5-975c-4cf6-85b4-db5fd0c7a103.jpg'
,'52b4bca4-b4cd-494c-af3d-e8796e2c0f83.jpg'
,'2e3a691e-61a6-4f5d-a1ec-667bd47d9112.jpg'
,'b89b8e96-ce56-42c9-abf4-c66cf2713de6.jpg'
,'6891b657-e10b-461c-b2da-48fd3b166b12.jpg'
,'6c9f2723-54c4-4b31-8c28-1267c26fc0b5.jpg'
,'f1b4368e-e329-4710-9ecc-5ad1b70f83c1.jpg'
,'0b1500cc-9b9b-4b36-a2c7-c1d8c10cfb7f.jpg'
,'5c46eef4-38e6-4c0d-a691-e697296dc4d1.jpg'
,'dad7d0e5-c2e1-4d12-babf-448261f3ea48.jpg'
,'f58855de-c703-47d0-9009-ce2f451d61ad.jpg'
,'fd2ddb14-4f47-4e94-bdf2-d7d3010b513d.jpg'
,'081fea9b-22af-4105-a291-71620d967d97.jpg'
,'191d24af-fe54-40b0-b7cb-15a2add32e9b.jpg'
,'c04f2a9c-5316-404f-906c-e13742d3ec16.jpg'
,'9ff54b0c-29b3-4dd7-af49-d45aa8bb9256.jpg'
,'80155430-b64f-489b-97cb-58e69d0229ad.jpg'
,'fe0aeac9-111c-4df1-840e-ac2288ce6a55.jpg'
,'61867d60-fa09-4303-ac3e-cf086b27a974.jpg'
,'13dc86dc-fd90-426f-bd2e-5bebc7d89ad5.jpg'
,'50dc91e2-47f3-47a0-acfc-6583ffa397f9.jpg'
,'74bf95af-6c1a-4bdd-9460-3fffff2607da.jpg'
,'8bf99c02-02f8-4589-8a43-2c05178e6f54.jpg'
,'58519a27-9049-43aa-9af8-bddaf8acbd00.jpg'
,'e644e4b7-7861-43a2-b4cd-4e102f45baa3.jpg'
,'1d8c6008-b011-44fb-9734-e930e5008e1a.jpg'
,'42f4f20b-1bf1-4ad7-8a04-8c3042028048.jpg'
,'107f43c8-06f2-41a0-84ad-8b14f58e8546.jpg'
,'bef15843-099b-4de6-9c50-347e8bfffd82.jpg'
,'d397e6e3-6df6-48a6-848c-d75a1f312190.jpg'
,'8796567d-bbdf-446c-bed3-f4addd6132f5.jpg'
,'8792068b-a65b-4607-b888-f7462867551f.jpg'
,'a2cbc2b3-4be0-4cb4-9c09-b527bda3b2ba.jpg'
,'61bb5172-5244-42d3-a064-28c41a71b58b.jpg'
,'e4060ba3-9c47-4a6f-a48c-23aef53b9625.jpg'
,'0f0453b0-dee0-4854-8506-d1e60e5a75eb.jpg'
,'61943e3e-10c6-4193-be8c-7253f7c3334c.jpg'
,'b01de0a6-2f5f-4e32-909f-b59ed2fd084f.jpg'
,'439a5df1-9b81-417d-82cf-0e94fc3e8a4b.jpg'
,'354c762f-524f-4a36-87d7-12298e9d6cd9.jpg'
,'f08d8eea-160a-4c61-9f7d-650101088a54.jpg'
,'33b52b00-7f70-48f8-ad90-1e4f9af508b5.jpg'
,'b82991f7-c2ef-4390-ae30-9c49ee735ce8.jpg'
,'38b79de0-45cf-4fde-8881-927fcf789693.jpg'
,'9d9d284f-e51f-44e7-9795-57ed626d27bd.jpg'
,'f8f52f5e-e2f5-4025-8917-1916f485c07f.jpg'
,'39c04b70-e545-4902-86b3-dbc99bdb96cd.jpg'
,'94030c49-b667-458a-b252-d7b3d6f977e7.jpg')