import { firestore } from 'firebase-admin';
import * as faker from 'faker';


// enable short hand for console.log()
function log(message: string) { console.log(`FakeDataPopulator | ${message}`); }
const FAKE_REGION_NAME = 'cape-town'
const NUMBER_OF_FAKE_MERCHANTS = 10
const NUMBER_OF_FAKE_PRODUCTS_PER_MERCHANTS = 30
/**
 * A class that helps with populating a local firestore database
 */
export class FakeDataPopulator {
  /**
   * The database to populat
   */
  firestoreDatabase: firestore.Firestore;

  constructor(
    firestoreDatabase: firestore.Firestore,
  ) {
    this.firestoreDatabase = firestoreDatabase;
  }

  async generateFakeData() {
    log('generateFakeData');

    const generateDocument = await this.getGenerateDocument().get();

    if (!generateDocument.exists) {
      await this.createGenerateDocument();
      await this.generateMerchants();
      await this.generateRegions();
    }
  }

  private async generateRegions() {
    log('generateRegions');

    await this.firestoreDatabase.collection('regions').doc(FAKE_REGION_NAME).set({});
  }

  private async generateMerchants() {
    log('generateMerchants');

    for (let index = 0; index < NUMBER_OF_FAKE_MERCHANTS; index++) {
      let merchant = {
        'name': faker.commerce.productName(),
        'image': faker.image.imageUrl(640, 640, 'food'),
        'categories': [
          faker.commerce.department(),
          faker.commerce.department()
        ],
        'rating': faker.datatype.float(2),
        'numberOfRatings': faker.datatype.number(200),
      };

      let merchantId =
        await this.createMerchantDocumentForSpecificRegion(merchant, FAKE_REGION_NAME);
      await this.generateMerchantsProducts(merchantId);
    }
  }

  private async generateMerchantsProducts(merchantId: string) {
    log(`generateMerchantsProducts merchatId:${merchantId}`);

    for (let index = 0; index < NUMBER_OF_FAKE_PRODUCTS_PER_MERCHANTS; index++) {
      let product = {
        'name': faker.commerce.productName(),
        'description': faker.lorem.paragraph(2),
        'image': faker.image.imageUrl(640, 640, 'food'),
        'category': faker.commerce.department(),
        'price': faker.datatype.number(8999),
      };

      await this.createMerchantProductForSpecificRegion(merchantId, product);
    }
  }
  private async createMerchantDocumentForSpecificRegion(merchant: any, regionId: string): Promise<string> {
    let documentReference = await this.firestoreDatabase.collection('regions').doc(regionId).collection('merchants').add(merchant);
    return documentReference.id;
  }

  private async createMerchantProductForSpecificRegion(merchantId: string, product: any) {
    await this.firestoreDatabase.collection('regions').doc(FAKE_REGION_NAME).collection('merchants').doc(merchantId).collection('products').add(product)
  }

  private async createGenerateDocument(): Promise<void> {
    log('createGenerateDocument');
    await this.getGenerateDocument().set({});
  }

  private getGenerateDocument(): firestore.DocumentReference {
    return this.firestoreDatabase.collection('data').doc('generate');
  }

}