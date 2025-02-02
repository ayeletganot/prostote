-- CreateTable
CREATE TABLE "Product" (
    "Id" UUID NOT NULL DEFAULT gen_random_uuid(),
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "images" TEXT[],
    "brand" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "stock" INTEGER NOT NULL,
    "price" DECIMAL(12,2) NOT NULL DEFAULT 0,
    "rating" DECIMAL(3,2) NOT NULL DEFAULT 0,
    "numReviews" INTEGER NOT NULL DEFAULT 0,
    "idfeatured" BOOLEAN NOT NULL,
    "banner" TEXT,
    "createAt" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("Id")
);

-- CreateIndex
CREATE UNIQUE INDEX "product_slug_idx" ON "Product"("slug");
