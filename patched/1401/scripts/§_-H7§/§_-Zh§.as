package §_-H7§
{
   import §_-I10§.§_-428§;
   import §_-I10§.§_-X2T§;
   import §_-I10§.§_-a1D§;
   import §_-I10§.§_-e1z§;
   import §_-I10§.§_-g2W§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import views.§_-fa§;
   import views.§_-rL§;
   
   public class §_-Zh§ extends Sprite
   {
      
      private static const §_-l2c§:int = 60;
      
      public function §_-Zh§(param1:int, param2:int)
      {
         super();
         this.build(param1,param2);
      }
      
      private function build(param1:int, param2:int) : void
      {
         var icon:DisplayObject = null;
         var iconClass:Class = null;
         var bounds:Rectangle = null;
         var type:int = param1;
         var id:int = param2;
         switch(type)
         {
            case §_-428§.§_-113§:
               icon = new ImageIconCoinsBig();
               icon.scaleX = icon.scaleY = §_-l2c§ * 2 / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-428§.§_-wG§:
               icon = new ImageIconNut();
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-428§.§_-61Q§:
               addChild(new EnergyGlassBigImage());
               break;
            case §_-428§.§_-a1H§:
               addChild(new ManaGlassBigImage());
               break;
            case §_-428§.§_-O2P§:
               icon = new (getDefinitionByName(§_-e1z§.DATA[id]["imageClass"]) as Class)();
               icon.scaleX = icon.scaleY = §_-e1z§.DATA[id]["imageScaleXY"];
               addChild(icon);
               break;
            case §_-428§.§_-Z2n§:
               switch(id)
               {
                  case 0:
                     iconClass = ImageIconCollection;
                     break;
                  case 1:
                     iconClass = ImageIconCollectionRare;
               }
               icon = new iconClass();
               icon.scaleX = icon.scaleY = §_-l2c§ * 1.8 / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-428§.§_-dU§:
               switch(id)
               {
                  case §_-g2W§.§_-Q1I§:
                     iconClass = ImageIconRandomRarePackage;
                     break;
                  case §_-g2W§.§_-I2F§:
                     iconClass = ImageIconRandomLegendaryPackage;
                     break;
                  default:
                     iconClass = ImageIconRandomPackage;
               }
               icon = new iconClass();
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-428§.§_-N1P§:
               icon = new §_-rL§(id,true,function():void
               {
                  icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               });
               addChild(icon);
               break;
            case §_-428§.§_-m2z§:
               icon = new §_-fa§(id,true);
               addChild(icon);
               break;
            case §_-428§.§_-Q1C§:
               if(id == §_-428§.§_-A2C§)
               {
                  icon = new §_-jv§();
                  icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
                  addChild(icon);
                  break;
               }
               iconClass = §_-X2T§.§_-D2L§(id);
               icon = new iconClass();
               if(icon is MovieClip)
               {
                  (icon as MovieClip).gotoAndStop(1);
               }
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
               bounds = icon.getBounds(this);
               icon.x = -bounds.x;
               icon.y = -bounds.y;
               break;
            case §_-428§.§_-wG§:
               icon = new ImageIconNut();
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-428§.§_-P13§:
               addChild(new ImageBundleExp());
               break;
            case §_-428§.§_-Ee§:
               iconClass = §_-a1D§.§_-1A§(id);
               icon = new iconClass();
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-428§.§_-8r§:
               icon = new ImageIconRating();
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
         }
      }
   }
}

