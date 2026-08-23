package §_-5T§
{
   import §_-X1k§.§_-42H§;
   import §_-X1k§.§_-L1o§;
   import §_-X1k§.§_-P2x§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextFormat;
   import utils.§_-Y11§;
   
   public class §_-Ws§ extends Sprite
   {
      
      private static const §_-R1L§:String = gls("<body><b>Обмен недоступен:</b> ты собрал не все предметы для обмена.</body>");
      
      private static const §_-3U§:String = gls("<body><b>Обмен недоступен:</b> необходимо собрать Скрэта.</body>");
      
      private static const §_-sM§:String = gls("<body><b>Обмен недоступен:</b> необходимо собрать Скрэтти.</body>");
      
      public var §_-t1f§:int;
      
      private var §_-W2v§:§_-g1S§ = null;
      
      public var §_-Ch§:§_-Wv§ = null;
      
      public function §_-Ws§(param1:int)
      {
         super();
         this.§_-t1f§ = param1;
         this.init();
      }
      
      public function setData(param1:Vector.<§_-Y11§>) : void
      {
         this.§_-W2v§.setData(param1);
      }
      
      public function §_-g2U§(param1:Boolean) : void
      {
         this.§_-Ch§.§_-J29§ = false;
         this.§_-W2v§.§_-g2U§(param1);
      }
      
      public function update(param1:Boolean) : void
      {
         this.§_-Ch§.available = !param1;
         if(!param1)
         {
            this.§_-71j§();
         }
      }
      
      private function init() : void
      {
         this.graphics.beginFill(14535087);
         this.graphics.drawRoundRect(0,0,854,55,5,5);
         addChild(new §_-i5§(gls("Необходимые\nколлекции"),11,6,new TextFormat(§_-i5§.§_-p1s§,16,16777215,true,null,null,null,null,"center")));
         this.§_-W2v§ = new §_-g1S§(this.§_-t1f§);
         this.§_-W2v§.x = 159;
         this.§_-W2v§.y = 3;
         this.§_-W2v§.addEventListener(Event.CHANGE,this.§_-71j§);
         addChild(this.§_-W2v§);
         this.§_-Ch§ = new §_-Wv§(this.§_-t1f§);
         addChild(this.§_-Ch§);
      }
      
      private function §_-71j§(param1:Event = null) : void
      {
         var _loc2_:Boolean = this.§_-W2v§.§_-L2F§();
         var _loc3_:String = _loc2_ ? "" : §_-R1L§;
         var _loc4_:int = int(§_-42H§.§_-s1B§[this.§_-t1f§]["clothesId"]);
         var _loc5_:int = §_-P2x§.§_-VD§(§_-42H§.§_-s1B§[this.§_-t1f§]["clothesId"]);
         switch(_loc5_)
         {
            case §_-P2x§.§_-C1d§:
               if(§_-L1o§.§_-2g§ || _loc4_ == §_-P2x§.§_-rR§)
               {
                  break;
               }
               _loc3_ = §_-3U§;
               _loc2_ = false;
               break;
            case §_-P2x§.§_-9f§:
               if(§_-L1o§.§_-UU§ || _loc4_ == §_-P2x§.§_-b2N§)
               {
                  break;
               }
               _loc3_ = §_-sM§;
               _loc2_ = false;
         }
         this.§_-Ch§.§_-vV§(!_loc2_,_loc3_);
      }
   }
}

