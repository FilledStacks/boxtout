import { firestore } from 'firebase-admin';
import * as faker from 'faker';


// enable short hand for console.log()
function log(message: string) { console.log(`FakeDataPopulator | ${message}`); }

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
    }
  }

  private async generateMerchants() {
    log('generateMerchants');

    for (let index = 0; index < 30; index++) {
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

      let merchantId = await this.createMerchantDocument(merchant);
      await this.generateMerchantsProducts(merchantId);
    }
  }

  private async generateMerchantsProducts(merchatId: string) {
    log(`generateMerchantsProducts merchatId:${merchatId}`);

    for (let index = 0; index < 30; index++) {
      let product = {
        'name': faker.commerce.productName(),
        'description': faker.lorem.paragraph(2),
        'image': faker.image.imageUrl(640, 640, 'food'),
        'category': faker.commerce.department(),
        'price': faker.datatype.number(8999),
      };

      await this.createMerchantProduct(merchatId, product);
    }
  }

  private async createMerchantProduct(merchantId: string, product: any) {
    await this.firestoreDatabase.collection('merchants').doc(merchantId).collection('products').add(product);
  }

  private async createMerchantDocument(merchant: any): Promise<string> {
    let documentReference = await this.firestoreDatabase.collection('merchants').add(merchant);
    return documentReference.id;
  }

  private async createGenerateDocument(): Promise<void> {
    log('createGenerateDocument');
    await this.getGenerateDocument().set({});
  }

  private getGenerateDocument(): firestore.DocumentReference {
    return this.firestoreDatabase.collection('data').doc('generate');
  }
}