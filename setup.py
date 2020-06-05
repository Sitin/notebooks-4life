import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()

setuptools.setup(
    name="notebooks-4life", # Replace with your own username
    version="0.0.1",
    author="Mykhailo Ziatin",
    author_email="mikhail.zyatin@gmail.com",
    description="Notebooks for life",
    long_description=long_description,
    long_description_content_type="text/markdown",
    url="https://stash.stepstone.com/projects/UNIV/repos/notebooks",
    packages=setuptools.find_packages(),
    classifiers=[
        "Programming Language :: Python :: 3",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.8',
)
