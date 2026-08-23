package §_-f1x§
{
   import §_-I10§.§_-g2W§;
   import §_-I10§.§_-h1f§;
   import §_-I10§.§_-vy§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFormat;
   import utils.§_-Y25§;
   
   public class §_-b22§ extends Sprite
   {
      
      private static const §_-41E§:String = gls("<body><b>Обмен недоступен:</b> ты собрал не все предметы для обмена.</body>");
      
      private static const §_-922§:String = gls("<body><b>Обмен недоступен:</b> необходимо собрать Скрэта.</body>");
      
      private static const §_-y1T§:String = gls("<body><b>Обмен недоступен:</b> необходимо собрать Скрэтти.</body>");
      
      public var §_-j1K§:int;
      
      private var §_-x1E§:§_-SJ§ = null;
      
      public var §_-L1I§:§_-F1R§ = null;
      
      public function §_-b22§(param1:int)
      {
         super();
         this.§_-j1K§ = param1;
         this.init();
      }
      
      public function setData(param1:Vector.<§_-Y25§>) : void
      {
         this.§_-x1E§.setData(param1);
      }
      
      public function §_-31O§(param1:Boolean) : void
      {
         this.§_-L1I§.§_-J11§ = false;
         this.§_-x1E§.§_-31O§(param1);
      }
      
      public function update(param1:Boolean) : void
      {
         this.§_-L1I§.available = !param1;
         if(!param1)
         {
            this.§_-A2D§();
         }
      }
      
      private function init() : void
      {
         this.graphics.beginFill(14535087);
         this.graphics.drawRoundRect(0,0,854,55,5,5);
         addChild(new §_-22V§(gls("Необходимые\nколлекции"),11,6,new TextFormat(§_-22V§.§_-pJ§,16,16777215,true,null,null,null,null,"center")));
         this.§_-x1E§ = new §_-SJ§(this.§_-j1K§);
         this.§_-x1E§.x = 159;
         this.§_-x1E§.y = 3;
         this.§_-x1E§.addEventListener(Event.CHANGE,this.§_-A2D§);
         addChild(this.§_-x1E§);
         this.§_-L1I§ = new §_-F1R§(this.§_-j1K§);
         addChild(this.§_-L1I§);
      }
      
      private function §_-A2D§(param1:Event = null) : void
      {
         var _loc2_:Boolean = this.§_-x1E§.§_-O1i§();
         var _loc3_:String = _loc2_ ? "" : §_-41E§;
         var _loc4_:int = int(§_-vy§.§_-k1M§[this.§_-j1K§]["clothesId"]);
         var _loc5_:int = §_-g2W§.§_-z1V§(§_-vy§.§_-k1M§[this.§_-j1K§]["clothesId"]);
         switch(_loc5_)
         {
            case §_-g2W§.§_-x2F§:
               if(§_-h1f§.§_-516§ || _loc4_ == §_-g2W§.§_-q1G§)
               {
                  break;
               }
               _loc3_ = §_-922§;
               _loc2_ = false;
               break;
            case §_-g2W§.§_-k22§:
               if(§_-h1f§.§_-q2X§ || _loc4_ == §_-g2W§.§_-qT§)
               {
                  break;
               }
               _loc3_ = §_-y1T§;
               _loc2_ = false;
         }
         this.§_-L1I§.§_-bz§(!_loc2_,_loc3_);
      }
   }
}

