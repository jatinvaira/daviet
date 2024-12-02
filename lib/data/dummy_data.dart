import 'package:buxx/features/shop/models/brand_model.dart';
import 'package:buxx/features/shop/models/product_attribute_model.dart';
import 'package:buxx/features/shop/models/product_variation_model.dart';
import 'package:buxx/utils/constants/image_strings.dart';

import '../features/shop/models/product_model.dart';

// class TDummyData {
//   // static final List<BannerModel> banners= [
//   //   BannerModel(imageUrl: DImages.banner1, targetScreen: TRoutes.order, acive: false),
//   // ];
//
//   // static final UserModel user = UserModel(
//   //   firstName: 'Jatin',
//   //   lastName: 'Vaira',
//   //   email: 'jatinvaira@gmail.com',
//   //   phoneNumber: '+919478600000',
//   //   profilePicture: DImages.user,
//   //   addresses:[
//   //     AddressModel(  )
//   //   ]
//   // )
//
//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '002',
//       title: 'Green Nike Sports shoe',
//       stock: 15,
//       price: 135,
//       isFeatured: true,
//       thumbnail: DImages.productImage5,
//       description: 'Green Nike shoe',
//       brand: BrandModel(
//           id: '1',
//           image: DImages.nikeLogo,
//           name: 'Nike',
//           isFeatured: true,
//           productsCount: 265),
//       images: [
//         DImages.productImage1,
//         DImages.productImage2,
//         DImages.productImage3,
//         DImages.productImage4
//       ],
//       salePrice: 30,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productAttributes: [
//         ProductAttributeModel(name: "Color", values: ['Green', 'Black', 'Red']),
//         ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
//       ],
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
//             description: 'This is a product dec for nke sp shows',
//             image: DImages.productImage1,
//             salePrice: 122.6,
//             price: 134,
//             stock: 34)
//       ],
//       productType: 'ProductType.variable',
//     )
//   ];
// }

class TDummyData {
  static final List<ProductModel> products = [
    ProductModel(
      id: '002',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: DImages.productImage5,
      description: 'Green Nike shoe',
      brand: BrandModel(
          id: '1',
          image: DImages.nikeLogo,
          name: 'Nike',
          isFeatured: true,
          productsCount: 265),
      images: [
        DImages.productImage1,
        DImages.productImage2,
        DImages.productImage3,
        DImages.productImage4
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: "Color", values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          attributeValues: {'Color': 'Green', 'Size': 'EU 34'},
          description: 'Green Nike shoe with EU 34 size',
          image: DImages.productImage1,
          salePrice: 122.6,
          price: 134,
          stock: 34,
        ),
        ProductVariationModel(
          id: '2',
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
          description: 'Black Nike shoe with EU 32 size',
          image: DImages.productImage2,
          salePrice: 120.0,
          price: 130,
          stock: 25,
        ),
        ProductVariationModel(
          id: '3',
          attributeValues: {'Color': 'Red', 'Size': 'EU 30'},
          description: 'Red Nike shoe with EU 30 size',
          image: DImages.productImage3,
          salePrice: 115.0,
          price: 125,
          stock: 20,
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '003',
      title: 'Adidas Running Shoe',
      stock: 20,
      price: 150,
      isFeatured: true,
      thumbnail: DImages.productImage6,
      description: 'High-quality running shoe by Adidas',
      brand: BrandModel(
          id: '2',
          image: DImages.adidasLogo,
          name: 'Adidas',
          isFeatured: true,
          productsCount: 300),
      images: [
        DImages.productImage6,
        DImages.productImage7,
        DImages.productImage8,
        DImages.productImage9
      ],
      salePrice: 140,
      sku: 'ADR7894',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'White', 'Gray']),
        ProductAttributeModel(name: 'Size', values: ['EU 36', 'EU 38', 'EU 40'])
      ],
      productVariations: [
        ProductVariationModel(
          id: '4',
          attributeValues: {'Color': 'Blue', 'Size': 'EU 36'},
          description: 'Blue Adidas running shoe EU 36',
          image: DImages.productImage6,
          salePrice: 135.0,
          price: 145,
          stock: 18,
        ),
        ProductVariationModel(
          id: '5',
          attributeValues: {'Color': 'White', 'Size': 'EU 38'},
          description: 'White Adidas running shoe EU 38',
          image: DImages.productImage7,
          salePrice: 130.0,
          price: 140,
          stock: 22,
        ),
        ProductVariationModel(
          id: '6',
          attributeValues: {'Color': 'Gray', 'Size': 'EU 40'},
          description: 'Gray Adidas running shoe EU 40',
          image: DImages.productImage8,
          salePrice: 125.0,
          price: 135,
          stock: 15,
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '004',
      title: 'Puma Casual Sneakers',
      stock: 12,
      price: 100,
      isFeatured: false,
      thumbnail: DImages.productImage10,
      description: 'Comfortable and stylish casual sneakers by Puma',
      brand: BrandModel(
          id: '3',
          image: DImages.pumaLogo,
          name: 'Puma',
          isFeatured: false,
          productsCount: 150),
      images: [
        DImages.productImage10,
        DImages.productImage11,
        DImages.productImage12,
        DImages.productImage13
      ],
      salePrice: 90,
      sku: 'PMX3456',
      categoryId: '3',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Yellow', 'White']),
        ProductAttributeModel(name: 'Size', values: ['EU 39', 'EU 41'])
      ],
      productVariations: [
        ProductVariationModel(
          id: '7',
          attributeValues: {'Color': 'Yellow', 'Size': 'EU 39'},
          description: 'Yellow Puma sneakers EU 39',
          image: DImages.productImage10,
          salePrice: 85.0,
          price: 95,
          stock: 10,
        ),
        ProductVariationModel(
          id: '8',
          attributeValues: {'Color': 'White', 'Size': 'EU 41'},
          description: 'White Puma sneakers EU 41',
          image: DImages.productImage11,
          salePrice: 88.0,
          price: 98,
          stock: 8,
        ),
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
