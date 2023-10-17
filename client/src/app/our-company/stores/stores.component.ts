import { Component, OnDestroy, OnInit } from '@angular/core';
import * as L from 'leaflet';
import { Subscription, finalize } from 'rxjs';

// INTERFACES
import { Store } from 'src/app/interfaces/store.interface';

// SERVICES
import { InfoService } from 'src/app/services/info.service';
import { LoadingService } from 'src/app/services/loading.service';
import { ErrorHandlingService } from 'src/app/services/error-handling.service';

@Component({
  selector: 'app-stores',
  templateUrl: './stores.component.html',
  styleUrls: ['./stores.component.css'],
})
export class StoresComponent implements OnInit, OnDestroy {
  map: any;
  theMarker: {} = {};
  storesSubscription: Subscription = new Subscription();
  stores: Store[] = [];
  filteredStores: Store[] = [];
  storeErrorMessage: string = '';
  search: string = '';

  constructor(
    private loadingService: LoadingService,
    private infoService: InfoService,
    private errorHandlingService: ErrorHandlingService
  ) {}

  ngOnInit(): void {
    this.loadingService.setPageLoadingInit();
    this.mapInit();

    this.getStoresInfo();
  }

  mapInit(): void {
    this.map = L.map('map').setView([44.8144092, 20.4604764], 8);

    L.tileLayer('https://tile.openstreetmap.fr/hot/{z}/{x}/{y}.png', {
      maxZoom: 18,
      minZoom: 3,
      attribution:
        '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
    }).addTo(this.map);
  }

  getStoresInfo(): void {
    this.loadingService.setPageLoading(true);
    this.storesSubscription = this.infoService
      .getStoresInfo()
      .pipe(
        finalize(() => {
          this.loadingService.setPageLoading(false);
        })
      )
      .subscribe({
        next: (data: Store[]) => {
          // Converting a latitude and longitude to type number
          data = data.map((store: Store) => {
            const modifiedStore: Store = {
              ...store,
              latitude: +store.latitude,
              longitude: +store.longitude,
            };

            return modifiedStore;
          });

          this.filteredStores = this.stores = data;
        },
        error: (err: any) => {
          this.storeErrorMessage = this.errorHandlingService.errorMessage(
            err.error.message,
            err.status
          );
          console.log(err);
        },
      });
  }

  filterStores(text: string): void {
    if (text === '') {
      this.filteredStores = this.stores;
    } else {
      this.filteredStores = this.filteredStores.filter((store: Store) => {
        if (
          this.checkText(store.store_name, text) ||
          this.checkText(store.city_name, text) ||
          this.checkText(store.street_name, text)
        ) {
          return store;
        }
      });
    }
  }

  checkText(text: string, toCheck: string) {
    if (text.toUpperCase().indexOf(toCheck.trim().toUpperCase()) !== -1) {
      return true;
    } else {
      return false;
    }
  }

  onMoveToStorePosition(
    latitude: number,
    longitude: number,
    name: string
  ): void {
    if (this.theMarker !== undefined) {
      this.map.removeLayer(this.theMarker);
    }
    this.map.setView([latitude, longitude], 15);
    this.theMarker = L.marker([latitude, longitude])
      .addTo(this.map)
      .bindPopup(name)
      .openPopup();
  }

  ngOnDestroy(): void {
    this.storesSubscription.unsubscribe();
  }
}
