package §_-u1R§
{
   import §_-X1k§.§_-A3y§;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-P2x§;
   import §_-X1k§.§_-ku§;
   import §_-X1k§.§_-n1C§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import views.§_-332§;
   import views.§_-Y1j§;
   
   public class §_-u1F§ extends Sprite
   {
      
      private static const §_-829§:int = 60;
      
      public function §_-u1F§(param1:int, param2:int)
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
            case §_-A3y§.§_-M1U§:
               icon = new ImageIconCoinsBig();
               icon.scaleX = icon.scaleY = §_-829§ * 2 / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-A3y§.§_-l2X§:
               icon = new ImageIconNut();
               icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-A3y§.§_-W27§:
               addChild(new EnergyGlassBigImage());
               break;
            case §_-A3y§.§_-fz§:
               addChild(new ManaGlassBigImage());
               break;
            case §_-A3y§.§_-y2q§:
               icon = new (getDefinitionByName(§_-ku§.DATA[id]["imageClass"]) as Class)();
               icon.scaleX = icon.scaleY = §_-ku§.DATA[id]["imageScaleXY"];
               addChild(icon);
               break;
            case §_-A3y§.§_-Z2h§:
               switch(id)
               {
                  case 0:
                     iconClass = ImageIconCollection;
                     break;
                  case 1:
                     iconClass = ImageIconCollectionRare;
               }
               icon = new iconClass();
               icon.scaleX = icon.scaleY = §_-829§ * 1.8 / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-A3y§.§_-t1F§:
               switch(id)
               {
                  case §_-P2x§.§_-Y1M§:
                     iconClass = ImageIconRandomRarePackage;
                     break;
                  case §_-P2x§.§_-A3§:
                     iconClass = ImageIconRandomLegendaryPackage;
                     break;
                  default:
                     iconClass = ImageIconRandomPackage;
               }
               icon = new iconClass();
               icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-A3y§.§_-o2t§:
               icon = new §_-Y1j§(id,true,function():void
               {
                  icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               });
               addChild(icon);
               break;
            case §_-A3y§.§_-33h§:
               icon = new §_-332§(id,true);
               addChild(icon);
               break;
            case §_-A3y§.§_-736§:
               if(id == §_-A3y§.§_-C2U§)
               {
                  icon = new §_-G2q§();
                  icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
                  addChild(icon);
                  break;
               }
               iconClass = §_-n1C§.§_-92G§(id);
               icon = new iconClass();
               if(icon is MovieClip)
               {
                  (icon as MovieClip).gotoAndStop(1);
               }
               icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               addChild(icon);
               bounds = icon.getBounds(this);
               icon.x = -bounds.x;
               icon.y = -bounds.y;
               break;
            case §_-A3y§.§_-l2X§:
               icon = new ImageIconNut();
               icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-A3y§.§_-V2n§:
               addChild(new ImageBundleExp());
               break;
            case §_-A3y§.§_-b1B§:
               iconClass = §_-C2b§.§_-K2T§(id);
               icon = new iconClass();
               icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               addChild(icon);
               break;
            case §_-A3y§.§_-j1G§:
               icon = new ImageIconRating();
               icon.scaleX = icon.scaleY = §_-829§ / Math.max(icon.width,icon.height);
               addChild(icon);
         }
      }
   }
}

