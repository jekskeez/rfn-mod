package §_-j2E§
{
   import §_-p2L§.§_-t2P§;
   import flash.display.MovieClip;
   
   public class §_-82S§ extends §_-t2P§
   {
      
      public function §_-82S§(param1:Hero)
      {
         super(param1);
      }
      
      override public function get activeTime() : Number
      {
         return 7;
      }
      
      override protected function §_-o2B§() : MovieClip
      {
         var answer:MovieClip = null;
         answer = new PerkSnowMaidenView();
         answer.scaleX = answer.scaleY = 0.7;
         answer.y -= 60;
         answer.addFrameScript(answer.totalFrames - 1,function():void
         {
            answer.gotoAndPlay(16);
         });
         return answer;
      }
   }
}

