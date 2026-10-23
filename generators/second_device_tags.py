from infrahub_sdk.generator import InfrahubGenerator


class SecondDeviceTagsGenerator(InfrahubGenerator):
    async def generate(self, data: dict) -> None:
        device = data["TestingDevice"]["edges"][0]["node"]
        role = device["role"]["value"] or "none"
        tag = await self.client.create(
            kind="BuiltinTag",
            data={"name": f"second-role-{role}", "description": "Created by the second_device_tags generator"},
        )
        await tag.save(allow_upsert=True)
