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
   import flash.events.Event;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import views.§_-M2v§;
   import views.§_-rL§;
   
   public class §_-z1v§ extends Sprite
   {
      
      private static const §_-l2c§:int = 25;
      
      public function §_-z1v§(param1:int, param2:int)
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
         var async:Boolean = false;
         switch(type)
         {
            case §_-428§.§_-113§:
               addChild(new ImageIconCoins());
               break;
            case §_-428§.§_-wG§:
               addChild(new ImageIconNut());
               break;
            case §_-428§.§_-61Q§:
               addChild(new ImageIconEnergy());
               break;
            case §_-428§.§_-a1H§:
               addChild(new ImageIconMana());
               break;
            case §_-428§.§_-O2P§:
               icon = new (getDefinitionByName(§_-e1z§.DATA[id]["iconClass"]) as Class)();
               icon.scaleX = icon.scaleY = §_-e1z§.DATA[id]["iconScaleXY"];
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
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
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
               async = true;
               icon = new §_-rL§(id,true,function():void
               {
                  icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               });
               addChild(icon);
               icon.addEventListener(Event.COMPLETE,this.§_-Y13§);
               break;
            case §_-428§.§_-m2z§:
               async = true;
               icon = new §_-M2v§(id,true,function():void
               {
                  icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               });
               addChild(icon);
               icon.addEventListener(Event.COMPLETE,this.§_-Y13§);
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
            case §_-428§.§_-P13§:
               addChild(new ImageIconExp());
               break;
            case §_-428§.§_-cb§:
               addChild(new ImageIconShamanExp());
               break;
            case §_-428§.§_-Ee§:
               iconClass = §_-a1D§.§_-1A§(id);
               icon = new iconClass();
               addChild(icon);
               break;
            case §_-428§.§_-8r§:
               icon = new ImageIconRating();
               icon.scaleX = icon.scaleY = §_-l2c§ / Math.max(icon.width,icon.height);
               addChild(icon);
         }
         if(!async)
         {
            setTimeout(this.§_-i15§,0);
         }
      }
      
      private function §_-i15§() : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function §_-Y13§(param1:Event) : void
      {
         param1.currentTarget.removeEventListener(Event.COMPLETE,this.§_-Y13§);
         dispatchEvent(new Event(Event.COMPLETE));
      }
   }
}

