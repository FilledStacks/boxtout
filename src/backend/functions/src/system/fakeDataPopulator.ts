import { firestore } from 'firebase-admin';


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

      this.generateMerchants();
    }
  }

  private generateMerchants() {
    log('generateMerchants');
    
    this.firestoreDatabase.collection('merchants').add({
      'name': 'I am first merchant'
    });
  }

  private async createGenerateDocument(): Promise<void> {
    log('createGenerateDocument');
    await this.getGenerateDocument().set({});
  }

  private getGenerateDocument(): firestore.DocumentReference {
    return this.firestoreDatabase.collection('data').doc('generate');
  }
}